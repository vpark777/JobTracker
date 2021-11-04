//
//  DetailSmallContentView.swift
//  JobTracker
//
//  Created by Victoria Park on 11/4/21.
//

import UIKit

class DetailSmallContentView: UIView {
  //Displays only
    
    let statusView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "status"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let companyView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "company"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let roleView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "role"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let teamView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "team"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let locationView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "location"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let linkView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "link"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let notesView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "notes"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let interviewDateView:LabelLabelView = {
        let view = LabelLabelView()
        view.label.text = "interview date"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addViews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.addSubview(statusView)
        self.addSubview(companyView)
        self.addSubview(roleView)
        self.addSubview(teamView)
        self.addSubview(locationView)
        self.addSubview(linkView)
        self.addSubview(notesView)
        self.addSubview(interviewDateView)
    }
    
    private func setupUI(){
       NSLayoutConstraint.activate([
           statusView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
           statusView.widthAnchor.constraint(equalTo: self.widthAnchor),
           statusView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
          statusView.trailingAnchor.constraint(equalTo:self.trailingAnchor),
           statusView.heightAnchor.constraint(equalToConstant: 95)
       ])
      
       NSLayoutConstraint.activate([
      
           companyView.topAnchor.constraint(equalTo: statusView.bottomAnchor, constant: 20),
           companyView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           companyView.widthAnchor.constraint(equalTo: self.widthAnchor),
           companyView.heightAnchor.constraint(equalToConstant: 95)
       ])
       NSLayoutConstraint.activate([
           roleView.topAnchor.constraint(equalTo: companyView.bottomAnchor, constant: 10),
           roleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           roleView.widthAnchor.constraint(equalTo: self.widthAnchor),
           roleView.heightAnchor.constraint(equalToConstant: 95)
       ])
       NSLayoutConstraint.activate([
           teamView.topAnchor.constraint(equalTo: roleView.bottomAnchor, constant: 10),
           teamView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           teamView.widthAnchor.constraint(equalTo: self.widthAnchor),
           teamView.heightAnchor.constraint(equalToConstant: 95)
       ])
       NSLayoutConstraint.activate([
           locationView.topAnchor.constraint(equalTo: teamView.bottomAnchor, constant: 10),
           locationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           locationView.widthAnchor.constraint(equalTo: self.widthAnchor),
           locationView.heightAnchor.constraint(equalToConstant: 95)
       ])
       NSLayoutConstraint.activate([
           linkView.topAnchor.constraint(equalTo: locationView.bottomAnchor, constant: 10),
           linkView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           linkView.widthAnchor.constraint(equalTo: self.widthAnchor),
           linkView.heightAnchor.constraint(equalToConstant: 95)
       ])
       NSLayoutConstraint.activate([
           notesView.topAnchor.constraint(equalTo: linkView.bottomAnchor, constant: 10),
           notesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           notesView.widthAnchor.constraint(equalTo: self.widthAnchor),
           notesView.heightAnchor.constraint(equalToConstant: 95)
       ])
       NSLayoutConstraint.activate([
           interviewDateView.topAnchor.constraint(equalTo: notesView.bottomAnchor, constant: 10),
           interviewDateView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
           interviewDateView.widthAnchor.constraint(equalTo: self.widthAnchor),
          interviewDateView.heightAnchor.constraint(equalToConstant: 95)
       ])
   }

}
