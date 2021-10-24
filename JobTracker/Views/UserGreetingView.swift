//
//  UserGreetingView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/22/21.
//

import UIKit

class UserGreetingView: UIView {

    let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        return stackView
    }()
    
    let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let userProfileImageView: UIImageView = {
        let userImage = UIImageView(image: UIImage(systemName: "person.circle.fill"))
        userImage.translatesAutoresizingMaskIntoConstraints = false
        return userImage
    }()

    let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, Han"
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let aspirationLabel: UILabel = {
        let label = UILabel()
        let attributedString = NSMutableAttributedString(string: "Future iOS Engineer")
        attributedString.addAttribute(NSAttributedString.Key.kern, value: 2, range: NSRange(location: 0, length: attributedString.length))
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
// MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
        
// MARK: - UI Setup Functions
    private func setupUI() {
        labelStackView.addArrangedSubview(greetingLabel)
        labelStackView.addArrangedSubview(aspirationLabel)
        
        headerStackView.addArrangedSubview(userProfileImageView)
        headerStackView.addArrangedSubview(labelStackView)
        addSubview(headerStackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            headerStackView.topAnchor.constraint(equalTo: topAnchor),
            headerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            userProfileImageView.widthAnchor.constraint(equalToConstant: 44),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
}

