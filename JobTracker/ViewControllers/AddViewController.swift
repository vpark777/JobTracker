//
//  AddViewController.swift
//  JobTracker
//
//  Created by Victoria Park on 10/28/21.
//

import UIKit

class AddViewController: UIViewController {
    
    var editMode:Bool = false //set in initializer from add or
    //didSelect
    var job:Job? //passed in for edit mode
    weak var updateCollectionViewDelegate:CollectionViewReloadDelegate?
    weak var updateDetailViewDelegate:UpdateDetailViewDelegate?
    //if coming from detail view to edit mode
    
    //MARK: UI Component Declarations
    
    let roundedView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 229, green: 230, blue: 226)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let saveButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor(red:114,green:158,blue:161), for: .normal)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let scrollView:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    lazy var smallContentView:SmallContentView = {
        //contains StatusCreateView, StatusLabelsView,labelTFView
        let view = SmallContentView(isEditingMode: editMode)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Initializers
    init(cvDelegate:CollectionViewReloadDelegate? = nil,detailDelegate:UpdateDetailViewDelegate? = nil,editMode:Bool = false, job:Job? = nil){
        
        updateCollectionViewDelegate = cvDelegate
        updateDetailViewDelegate = detailDelegate
        
        self.editMode = editMode
        self.job = job
        super.init(nibName:nil, bundle:nil)
        
        addViews()
        setupUI()
        if editMode && job != nil{
            fillJobValues(job:job)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: class functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    private func addViews(){
        view.addSubview(roundedView)
        roundedView.addSubview(saveButton)
        roundedView.addSubview(scrollView)
        scrollView.addSubview(smallContentView)
    }
    
    private func setupUI(){
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 50),
            roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            roundedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 50),
            saveButton.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -20),
            saveButton.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 20)
        ])
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: roundedView.topAnchor,constant:90),
            scrollView.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor,constant:20),
            scrollView.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor,constant:-20),
            scrollView.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: roundedView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: smallContentView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: smallContentView.leadingAnchor,constant:-10),
            scrollView.trailingAnchor.constraint(equalTo: smallContentView.trailingAnchor,constant:13),
            scrollView.widthAnchor.constraint(equalTo: smallContentView.widthAnchor, constant:23),
            scrollView.bottomAnchor.constraint(equalTo: smallContentView.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: smallContentView.centerXAnchor),
            smallContentView.heightAnchor.constraint(equalToConstant: 1000)
        ])
    }
    private func fillJobValues(job:Job?){
        if let job = job{
            smallContentView.companyView.textfield.text = job.name
            smallContentView.roleView.textfield.text = job.role
            smallContentView.teamView.textfield.text = job.team
            smallContentView.locationView.textfield.text = job.location
            
            smallContentView.statusCreateView.markStatus(status: Int(job.status))
            smallContentView.notesView.textfield.text = job.notes
            smallContentView.linkView.textfield.text = job.link
            smallContentView.interviewDateView.textfield.text = job.interviewDate
        }
    }
    
    @objc func saveButtonPressed(){
        print("accessing text in small content view ")
        print(smallContentView.companyView.textfield.text)
        let name = smallContentView.companyView.textfield.text ?? ""
        let role = smallContentView.roleView.textfield.text ?? ""
        let team = smallContentView.teamView.textfield.text ?? ""
        let location = smallContentView.locationView.textfield.text ?? ""
        let notes = smallContentView.notesView.textfield.text ?? ""
        let status = smallContentView.statusCreateView.selectedStatus
        let link = smallContentView.linkView.textfield.text ?? ""
        let interviewDate = smallContentView.interviewDateView.textfield.text ?? ""
        //add status boxes
        if !editMode{
            let item = DataManager.createJobItem(name: name, role:role, team:team,location: location,link:link, notes: notes, status: Int16(status), favorite: false,interviewDate: interviewDate)
            if item != nil{
                print("this item is added")
                //or could add item to jobsList
                updateCollectionViewDelegate?.reload()
            }
        } else if let job = job{
            DataManager.updateJob(item: job, name: name, role: role, team: team, location: location, link: link, notes: notes, status: Int16(status), favorite: false, interviewDate: interviewDate)
            
            updateDetailViewDelegate?.loadDetailPage(job: job)
        }
        self.dismiss(animated: false,completion:nil)
    }
    
}
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
