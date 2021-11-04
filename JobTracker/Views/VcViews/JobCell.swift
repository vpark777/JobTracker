//
//  JobCell.swift
//  JobTracker
//
//  Created by Victoria Park on 10/28/21.
//

import UIKit

class JobCell: UICollectionViewCell {
    static let identifier = "JobCell"
    
    let textStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 23, weight:.bold)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        return label
        
    }()
    
    lazy var locationLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight:.light)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let heartDateStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let heartButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(red: 220, green: 130, blue:146)
        button.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        return button
    }()
    let spacerLabel:UILabel = {
        let label = UILabel()
        label.text = "  "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    lazy var dateLabel:UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        var configuration = UIButton.Configuration.filled()
     //   configuration.title = "Some Day"
        label.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        configuration.buttonSize = .mini
        configuration.baseBackgroundColor = .white
        configuration.baseForegroundColor = .gray
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 7, bottom: 5, trailing: 7)
        label.configuration = configuration
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.alpha = 0.6
     //   label.setTitle("Wed 11/17", for: .normal) 
        return label
    }()
   
    override init(frame:CGRect){
        super.init(frame:frame)
        setupUI()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setColor(color:UIColor){
        self.contentView.backgroundColor = color
    }
    
    private func setupUI(){
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 30
        
        self.contentView.addSubview(textStack)
        textStack.addArrangedSubview(nameLabel)
        textStack.addArrangedSubview(locationLabel)
        self.contentView.addSubview(heartDateStack)
        heartDateStack.addArrangedSubview(heartButton)
        heartDateStack.addArrangedSubview(spacerLabel)
        heartDateStack.addArrangedSubview(dateLabel)
        
        NSLayoutConstraint.activate([
        
            textStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            textStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20),
            textStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            nameLabel.heightAnchor.constraint(equalToConstant: 40),
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 25),
            locationLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            heartDateStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            heartDateStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            heartDateStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            heartButton.widthAnchor.constraint(equalToConstant: 25),
            heartButton.heightAnchor.constraint(equalToConstant: 25),
            dateLabel.heightAnchor.constraint(equalToConstant: 25),
            dateLabel.trailingAnchor.constraint(equalTo: heartDateStack.trailingAnchor)
        ])
        
        dateLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
    
}
