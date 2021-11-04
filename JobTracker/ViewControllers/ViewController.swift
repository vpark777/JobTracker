//
//  ViewController.swift
//  JobTracker
//
//  Created by Hannie Kim on 10/20/21.
//

import UIKit
import CoreData

protocol AddViewPresentable:AnyObject{
    //passed to topView
    func presentAddVC()
}
protocol CollectionViewReloadDelegate:AnyObject{
    //passed to AddViewController
    func reload()
}
protocol StatusFilterDelegate:AnyObject{
    //passed to status view
    func setNewStatusFilters(switches:[Int])
}
protocol FavoritesFilterDelegate:AnyObject{
    func setFavoritesFilter(on:Bool)
}
protocol ResetStatusButtonsDelegate:AnyObject{
    //passed to status view
    func turnStatusButtonsOff()
}

class ViewController: UIViewController{
    
    let columns = 2
    var jobsList:[Job]?{
        //also need to set button count on topView
        didSet{
            openList = jobsList?.filter{ job in
                job.status == 0
            } ?? nil
            appliedList = jobsList?.filter{ job in
                job.status == 1
            } ?? nil
            interviewList = jobsList?.filter{ job in
                job.status == 2
            } ?? nil
            closedList = jobsList?.filter{ job in
                job.status == 3
            } ?? nil
            
            //set button count and refresh view
            //after adding status bars in add screen
            statusButtonView.openButton.count = openList?.count ?? 0
            statusButtonView.appliedButton.count = appliedList?.count ?? 0
            statusButtonView.interviewButton.count = interviewList?.count ?? 0
            statusButtonView.closedButton.count = closedList?.count ?? 0
        }
    }
    
    var filteredList:[Job]?
    var openList:[Job]?
    var appliedList:[Job]?
    var interviewList:[Job]?
    var closedList:[Job]?
    
    //MARK: UI Component Declarations
    
    lazy var topView:TopView = {
        let view = TopView(addViewDelegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var statusButtonView:StatusButtonsView = {
        let view = StatusButtonsView(filterDelegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
     lazy var collectionView:UICollectionView = {
         
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         let emptySpace =  20 * (columns + 1)
         let width = ( view.frame.width - CGFloat(emptySpace))/CGFloat(columns)
      
         layout.itemSize = CGSize(width:width, height:width)
         layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
         layout.minimumLineSpacing = 20
         
         let collectionView = UICollectionView(frame:.zero, collectionViewLayout:layout)
         collectionView.backgroundColor = UIColor(red: 229, green: 230, blue: 226)
         collectionView.layer.cornerRadius = 30
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
         collectionView.register(JobCell.self, forCellWithReuseIdentifier: JobCell.identifier)
         collectionView.collectionViewLayout  = layout
         return collectionView
     }()
     
    override func viewWillAppear(_ animated: Bool) {
        
        print("view will load")
        collectionView.dataSource = self
        collectionView.delegate = self
        jobsList = DataManager.fetchJobItems2()
        print("open list - \(openList?.count)")
        print("appleid list - \(appliedList?.count)")
        print("interview list - \(interviewList?.count)")
        print("closed list - \(closedList?.count)")
        
        filteredList = jobsList
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        let directory = NSPersistentContainer.defaultDirectoryURL()
        let url = directory.appendingPathComponent("JobTracker" + ".sqlite")
        print("sql directory : \(url)")
        setUpUI()
    }
  
    private func setUpUI(){
        view.layoutIfNeeded()
        view.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: self.view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        view.addSubview(statusButtonView)
        NSLayoutConstraint.activate([
            statusButtonView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant:20),
            statusButtonView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant:20),
            statusButtonView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant:-20)
        ])
         view.layoutIfNeeded()
        
        print(statusButtonView.interviewButton.frame.width)
        print(statusButtonView.interviewButton.frame.height)
        
        
        NSLayoutConstraint.activate ([
             collectionView.topAnchor.constraint(equalTo: statusButtonView.bottomAnchor, constant:30),
             collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
    }
}
extension ViewController:AddViewPresentable{
    func presentAddVC() {
        // Going to Add screen in Add mode
        print("hello presenting add")
        let addController = AddViewController(cvDelegate:self)
        addController.modalPresentationStyle = .automatic
        present(addController,animated:true)
    }
}
extension ViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("hello presenting add")
        if let job = filteredList?[indexPath.row]{
            /*
            let addController = AddViewController(delegate: self, editMode: true, job: job)
            addController.modalPresentationStyle = .automatic
            present(addController,animated:true)
             */
            let detailVC = DetailViewController(cvDelegate: self, job: job)
            detailVC.modalPresentationStyle = .automatic
            present(detailVC,animated:true)
        }
    }
    
}
extension ViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filteredList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobCell.identifier, for: indexPath) as? JobCell{
            cell.nameLabel.text = filteredList?[indexPath.row].name
            let jobLocationText = filteredList?[indexPath.row].location ?? ""
            cell.locationLabel.text = "📍\(jobLocationText)"
            let status = filteredList?[indexPath.row].status ?? 0
            
            switch status{
            case 0:// cell.contentView.backgroundColor = UIColor(red: 69, green: 123, blue: 157)
                cell.contentView.backgroundColor = UIColor(red: 96, green: 150, blue: 186)
            case 1: cell.contentView.backgroundColor = UIColor(red: 144, green: 190, blue: 109)
            case 2: cell.contentView.backgroundColor = UIColor(red: 248, green: 150, blue: 30)
            case 3: cell.contentView.backgroundColor = .gray
            default:cell.contentView.backgroundColor = .gray
            }
            if !(filteredList?[indexPath.row].favorite ?? false){
                cell.heartButton.alpha = 0
            } else {
                cell.heartButton.alpha = 1
            }
            if filteredList?[indexPath.row].status == 2 {
                if let date = filteredList?[indexPath.row].interviewDate,date != "" {
                    cell.dateLabel.alpha = 0.6
                    cell.dateLabel.setTitle(date, for: .normal)
                } else {
                    cell.dateLabel.alpha = 0
                }
            } else {
                cell.dateLabel.alpha = 0
            }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         print("💍💍💍💍  Trying to dequeue headerView ")
         guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else {
             assertionFailure("Could not dequeue \(HeaderView.self)")
             return UICollectionReusableView()
         }
         print("headerview's button width: \(headerView.favoritesButton.frame.width) height: \(headerView.favoritesButton.frame.height)")
         headerView.favoriteFilterDelegate = self
         headerView.resetStatusButtonsDelegate = self
         return headerView
     }
   
}

extension ViewController:CollectionViewReloadDelegate{
    func reload() {
        print("reloading view ")
        //can append to list here  then reload
        //also use this after editing screen
        ///
        self.jobsList = DataManager.fetchJobItems2()
        self.filteredList = self.jobsList
        //maybe need to make sure items have been saved
        // and returned before reloading 
        self.collectionView.reloadData()
    }
}
extension ViewController:FavoritesFilterDelegate{
    func setFavoritesFilter(on:Bool){
        if on{
            filteredList = jobsList?.filter{ job in
                job.favorite == true
            }
        } else {  //not on
            filteredList = jobsList
        }
        collectionView.reloadData()
    }
}
extension ViewController:StatusFilterDelegate{
    func setNewStatusFilters(switches:[Int]){
        //sends switch of on, off, on, off 4 arr items
        filteredList = []
        
        if switches[0] == 0 && switches[1] == 0 && switches[2] == 0 && switches[3] == 0 {
            filteredList = jobsList
            collectionView.reloadData()
            return
        }
        if switches[0] == 1 {
            if let openList = openList{
                filteredList?.append(contentsOf: openList)
            }
        }
        if switches[1] == 1 {
            if let appliedList = appliedList{
                filteredList?.append(contentsOf: appliedList)
            }
        }
        if switches[2] == 1 {
            if let interviewList = interviewList{
                filteredList?.append(contentsOf: interviewList)
            }
        }
        if switches[3] == 1 {
            if let closedList = closedList{
                filteredList?.append(contentsOf: closedList)
            }
        }
        collectionView.reloadData()
    }
    
}
extension ViewController:ResetStatusButtonsDelegate{
    func turnStatusButtonsOff() {
        statusButtonView.openButton.isOn = 0
        statusButtonView.appliedButton.isOn = 0
        statusButtonView.interviewButton.isOn = 0
        statusButtonView.closedButton.isOn = 0
    }
   
}
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:view.frame.size.width, height:60)
    }
}
