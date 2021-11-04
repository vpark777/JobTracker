//
//  DetailViewController.swift
//  JobTracker
//
//  Created by Victoria Park on 11/3/21.
//

import UIKit

protocol UpdateDetailViewDelegate:AnyObject{
    func loadDetailPage(job:Job)
}

class DetailViewController: UIViewController{

    var updateCollectionViewDelegate:CollectionViewReloadDelegate?
    // update in case heart is selected
    // also changes from edit mode from here
    // will be reloaded through this delegate in main VC
    
    //
    var job:Job?
    var heartButtonOnConfig:UIButton.Configuration!
    var heartButtonOffConfig:UIButton.Configuration!
    var onState = 0
    
    
    //MARK: UI Component Declarations
    
    let roundedView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 229, green: 230, blue: 226)
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     lazy var editButton:UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.setTitle("Edit", for: .normal)
         button.setTitleColor(UIColor(red:114,green:158,blue:161), for: .normal)
         button.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
         return button
     }()
    
    lazy var heartButton:UIButton = {
        //look at UIButton to find right look for heart image, text?
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        if let job = self.job, job.favorite{
            button.configuration = heartButtonOnConfig
            onState = 1
        } else {
            button.configuration = heartButtonOffConfig
            onState = 0
        }
        button.addTarget(self, action: #selector(toggleHeartButton), for: .touchUpInside)
         
        return button
    }()
 
    let scrollView:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let smallContentView:DetailSmallContentView = {
        let view = DetailSmallContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: Initializers
    
    init(cvDelegate:CollectionViewReloadDelegate? = nil, job:Job? = nil){
        self.job = job
        self.updateCollectionViewDelegate = cvDelegate
        super.init(nibName:nil, bundle:nil)
        configHeartButtonStates()
        addSubviews()
        setConstraints()
        if let job = job {
            fillInJobValues(job: job)
        }
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        updateCollectionViewDelegate?.reload()
    }
    
    //MARK: class functions
    private func configHeartButtonStates(){
        heartButtonOnConfig = UIButton.Configuration.filled()
        heartButtonOnConfig.image = UIImage(systemName: "heart.fill")
        heartButtonOnConfig.baseForegroundColor = UIColor(red: 236, green: 145, blue: 146) //reddish color
        heartButtonOnConfig.baseBackgroundColor = UIColor(red:229, green: 230, blue: 226) //greiyish color
        
        heartButtonOffConfig = UIButton.Configuration.tinted()
        heartButtonOffConfig.baseBackgroundColor = UIColor(red: 229, green: 230, blue: 226)
        heartButtonOffConfig.image = UIImage(systemName: "heart")
        heartButtonOffConfig.baseForegroundColor = UIColor(red: 236, green: 145, blue: 146)
    }
    private func addSubviews(){
        view.addSubview(roundedView)
        roundedView.addSubview(heartButton)
        roundedView.addSubview(editButton)
        roundedView.addSubview(scrollView)
        scrollView.addSubview(smallContentView)
    }
    
    func fillInJobValues(job:Job){
            smallContentView.statusView.valueLabel.text = job.name
            smallContentView.companyView.valueLabel.text = job.name
            smallContentView.roleView.valueLabel.text = job.role
            smallContentView.teamView.valueLabel.text = job.team
            smallContentView.locationView.valueLabel.text = job.location
            smallContentView.notesView.valueLabel.text = job.notes
            smallContentView.linkView.valueLabel.text = job.link
            smallContentView.interviewDateView.valueLabel.text = job.interviewDate
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 50),
            roundedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            roundedView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
         NSLayoutConstraint.activate([
             editButton.heightAnchor.constraint(equalToConstant: 50),
             editButton.widthAnchor.constraint(equalToConstant: 50),
             editButton.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -20),
             editButton.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 20)
         ])
        
         NSLayoutConstraint.activate([
             heartButton.heightAnchor.constraint(equalToConstant: 50),
             heartButton.widthAnchor.constraint(equalToConstant: 50),
             heartButton.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: -3),
             heartButton.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 20)
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
    
    @objc func editButtonPressed(){
        
        print("edit button pressed")
        print("hello presenting add")
        let addController = AddViewController(detailDelegate:self,editMode:true,job:job)
        addController.modalPresentationStyle = .automatic
        present(addController,animated:true)
    }
    @objc func toggleHeartButton(){
      
        if onState == 0{
            onState = 1
            heartButton.configuration = heartButtonOnConfig
            print("heart button turned on")
        } else {
            onState = 0
            heartButton.configuration = heartButtonOffConfig
            print("heart button turned off")
        }
        heartButton.layoutIfNeeded()
        
        if let job = job {
            let isFavorite = job.favorite
            DataManager.updateFavoriteStatus(item: job, favorite:!isFavorite)
        }
    }
}

extension DetailViewController:UpdateDetailViewDelegate{
    func loadDetailPage(job:Job){
        fillInJobValues(job: job)
    }
}
