//
//  StatusLabelsView.swift
//  JobTracker
//
//  Created by Victoria Park on 11/3/21.
//

import UIKit

class StatusLabelsView: UIView {
    
    let labelsStack:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    let openLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "open"
        return label
    }()
    let appliedLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "applied"
        return label
    }()
    let interviewLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.text = "interview"
        return label
    }()
    let closedLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        label.text = "closed"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addSubviews(){
        self.addSubview(labelsStack)
        labelsStack.addArrangedSubview(openLabel)
        labelsStack.addArrangedSubview(appliedLabel)
        labelsStack.addArrangedSubview(interviewLabel)
        labelsStack.addArrangedSubview(closedLabel)
        
    }
    private func activateConstraints(){
        NSLayoutConstraint.activate([
            labelsStack.topAnchor.constraint(equalTo: topAnchor),
            labelsStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            labelsStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            labelsStack.bottomAnchor.constraint(equalTo: bottomAnchor)
       ])
        NSLayoutConstraint.activate([
            openLabel.widthAnchor.constraint(equalToConstant: 60),
            openLabel.heightAnchor.constraint(equalToConstant: 18),
            appliedLabel.widthAnchor.constraint(equalToConstant: 60),
            appliedLabel.heightAnchor.constraint(equalToConstant: 18),
            interviewLabel.widthAnchor.constraint(equalToConstant: 60),
            interviewLabel.heightAnchor.constraint(equalToConstant: 18),
            closedLabel.widthAnchor.constraint(equalToConstant: 60),
            closedLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }

}
