//
//  SmallContentView.swift
//  JobTracker
//
//  Created by Victoria Park on 10/29/21.
//

import UIKit

protocol InterviewDateViewable:AnyObject{
    func hideInterviewDateView()
    func showInterviewDateView()
}

class SmallContentView: UIView{
    
    var isEditing:Bool = false
  //  var job:Job?
    
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        if isEditing{
            label.text = "Edit job Details"
        } else {
            label.text = "Add a new job"
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    let statusLabel:UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "status"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var statusCreateView:StatusCreateView = {
        let view = StatusCreateView(interviewDateDelegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statusLabelsView:StatusLabelsView = {
        let view = StatusLabelsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let companyView:labelTextFieldView = {
        let view = labelTextFieldView()
        view.label.text = "company"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let roleView:labelTextFieldView = {
        let view = labelTextFieldView()
        view.label.text = "role"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let teamView:labelTextFieldView = {
        let view = labelTextFieldView()
        view.label.text = "team / organization"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let locationView:labelTextFieldView = {
        let view = labelTextFieldView()
        view.label.text = "📍 location"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let linkView:labelTextFieldView = {
        let view = labelTextFieldView()
        view.label.text = "link"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let notesView:labelTextFieldView = {
        let view = labelTextFieldView()
        view.label.text = "notes"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let interviewDateView:labelTextFieldView = {
        let view = labelTextFieldView()
        view.label.text = "interview date"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  //  init(isEditingMode:Bool = false, job:Job? = nil) {
    init(isEditingMode:Bool = false){
        super.init(frame:.zero)
        print("Small ContentView being laid out")
        self.isEditing = isEditingMode
    
        addViews()
        setUpUI()
        
        //if editing mode
        //if there is job passed
        //have fillValues function
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.addSubview(titleLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusCreateView)
        self.addSubview(statusLabelsView)
        self.addSubview(companyView)
        self.addSubview(roleView)
        self.addSubview(teamView)
        self.addSubview(locationView)
        self.addSubview(linkView)
        self.addSubview(notesView)
        self.addSubview(interviewDateView)
    }
    private func setUpUI(){
        //insert statusEnterButtons
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            statusLabel.heightAnchor.constraint(equalToConstant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            statusCreateView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 5),
            statusCreateView.widthAnchor.constraint(equalTo: self.widthAnchor),
            statusCreateView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            statusCreateView.heightAnchor.constraint(equalToConstant: 60)
        ])
        NSLayoutConstraint.activate([
            statusLabelsView.topAnchor.constraint(equalTo: statusCreateView.bottomAnchor, constant: 5),
            statusLabelsView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            statusLabelsView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        NSLayoutConstraint.activate([
       
            companyView.topAnchor.constraint(equalTo: statusLabelsView.bottomAnchor, constant: 20),
            companyView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            companyView.widthAnchor.constraint(equalTo: self.widthAnchor),
            companyView.heightAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            roleView.topAnchor.constraint(equalTo: companyView.bottomAnchor, constant: 10),
            roleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            roleView.widthAnchor.constraint(equalTo: self.widthAnchor),
            roleView.heightAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            teamView.topAnchor.constraint(equalTo: roleView.bottomAnchor, constant: 10),
            teamView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            teamView.widthAnchor.constraint(equalTo: self.widthAnchor),
            teamView.heightAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            locationView.topAnchor.constraint(equalTo: teamView.bottomAnchor, constant: 10),
            locationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            locationView.widthAnchor.constraint(equalTo: self.widthAnchor),
            locationView.heightAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            linkView.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 10),
            linkView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            linkView.widthAnchor.constraint(equalTo: self.widthAnchor),
            linkView.heightAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            notesView.topAnchor.constraint(equalTo: linkView.bottomAnchor, constant: 10),
            notesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            notesView.widthAnchor.constraint(equalTo: self.widthAnchor),
            notesView.heightAnchor.constraint(equalToConstant: 78)
        ])
        NSLayoutConstraint.activate([
            interviewDateView.topAnchor.constraint(equalTo: notesView.bottomAnchor, constant: 10),
            interviewDateView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            interviewDateView.widthAnchor.constraint(equalTo: self.widthAnchor),
            interviewDateView.heightAnchor.constraint(equalToConstant: 78)
        ])
    }

}

extension SmallContentView:InterviewDateViewable{
    func hideInterviewDateView() {
        interviewDateView.alpha = 0
        self.setNeedsDisplay()
    }
    func showInterviewDateView() {
        interviewDateView.alpha = 1
        self.setNeedsDisplay()
    }
}
