//
//  labelTextFieldView.swift
//  JobTracker
//
//  Created by Victoria Park on 10/30/21.
//

import UIKit

class labelTextFieldView: UIView {

    let label:UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let textfield:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

 override init(frame: CGRect) {
     super.init(frame:frame)
     print("labelTextField being laid out")
     addViews()
     setUpUI()
 }
 
 required init?(coder: NSCoder) {
     super.init(coder: coder)
     fatalError("init(coder:) has not been implemented")
 }
 
 private func addViews(){
     self.addSubview(label)
     self.addSubview(textfield)
 }
 private func setUpUI(){
     NSLayoutConstraint.activate([
        label.topAnchor.constraint(equalTo: self.topAnchor),
        label.widthAnchor.constraint(equalTo: self.widthAnchor),
        label.heightAnchor.constraint(equalToConstant: 35),
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor)
     ])
     NSLayoutConstraint.activate([
        textfield.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 2),
        textfield.widthAnchor.constraint(equalTo: self.widthAnchor),
        textfield.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        textfield.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        textfield.heightAnchor.constraint(equalToConstant: 35)
     ])
 }
 
    
    
}
