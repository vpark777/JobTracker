//
//  LabelLabelView.swift
//  JobTracker
//
//  Created by Victoria Park on 11/4/21.
//

import UIKit

class LabelLabelView: UIView {

     let label:UILabel = {
        let label = UILabel()
         label.textColor = .lightGray
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     let valueLabel:UILabel = {
         let label = UILabel()
       //  label.backgroundColor = UIColor(red: 229, green: 230, blue: 226)
         label.textColor = .black
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
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
      self.addSubview(valueLabel)
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
         valueLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 2),
         valueLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
         valueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         valueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         valueLabel.heightAnchor.constraint(equalToConstant: 60)
      ])
  }
     
 }

