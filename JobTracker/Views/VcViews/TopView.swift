//
//  TopView.swift
//  JobTracker
//
//  Created by Victoria Park on 10/28/21.
//

 import UIKit

 class TopView: UIView {

 // MARK: - UI Component Declarations
     weak var addViewDelegate:AddViewPresentable?
    
     let ProfileStack: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .horizontal
         stackView.alignment = .top
         stackView.spacing = 10
         stackView.distribution = .fillProportionally
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()

     let profileImageView: UIImageView = {
         let picImage = UIImageView(image: UIImage(named: "ProfilePic"))
         picImage.contentMode = .scaleAspectFill
         picImage.translatesAutoresizingMaskIntoConstraints = false
         picImage.clipsToBounds = true
         return picImage
     }()
     
     let labelStack: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.alignment = .leading
         stackView.spacing = 2
         stackView.distribution = .fillProportionally
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()
     let headerLabel: UILabel = {
         let label = UILabel()
         label.text = "Good Morning, Victoria"
         label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
         label.textColor = .black
         label.textAlignment = .left
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     let profileRoleLabel:UILabel = {
         let label = UILabel()
         label.text = "Future iOS Engineer"
         label.font = UIFont.systemFont(ofSize: 15, weight: .light)
         label.textColor = .black
         label.textAlignment = .left
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
     
     let addButton:UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.tintColor = UIColor(red: 236, green: 145, blue: 146)
         button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
         button.setBackgroundImage(UIImage(systemName:"plus.circle.fill"), for: .normal)
         return button
     }()
     
     
 // MARK: - Initializers
     
     init(addViewDelegate:AddViewPresentable? = nil){
         self.addViewDelegate = addViewDelegate
         super.init(frame:.zero)
         addViews()
       //  activateConstraints()
     }
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         addViews()
      //   activateConstraints()
     }
     override func layoutSubviews() {
        
         activateConstraints()
     }
     
 // MARK: - UI Setup Functions
     
     private func addViews() {
         self.addSubview(ProfileStack)
         ProfileStack.addArrangedSubview(profileImageView)
         labelStack.addArrangedSubview(headerLabel)
         labelStack.addArrangedSubview(profileRoleLabel)
         ProfileStack.addArrangedSubview(labelStack)
         self.addSubview(addButton)
        
     }
     
     private func activateConstraints() {
         NSLayoutConstraint.activate([
            addButton.widthAnchor.constraint(equalToConstant: 50),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant:10),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ProfileStack.topAnchor.constraint(equalTo: addButton.bottomAnchor),
            ProfileStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            ProfileStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant:20),
            ProfileStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50)
            
         ])
         self.layoutIfNeeded()
         profileImageView.layer.cornerRadius = profileImageView.frame.width/2
         profileImageView.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
     }
     
     @objc func addButtonPressed() {
         addViewDelegate?.presentAddVC()
     }
 }

 
