//
//  StatusButton.swift
//  JobTracker
//
//  Created by Victoria Park on 10/31/21.
//

import UIKit


class StatusButton: UIButton {
// just appearance for button
    let themeColor:UIColor?
    var title:String?{
        didSet{
            nameLabel.text = title
        }
    }
    var count:Int = 0{
        didSet{
            countLabel.text = "\(count)"
        }
    }
    
    var isOn = 0 {
        didSet{
            if isOn == 0{
                setOffTheme()
            } else {
                setOnTheme()
            }
            self.setNeedsDisplay()
        }
    }
    
    //MARK: UI Component Declaration
    lazy var stackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.isUserInteractionEnabled = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.text = title
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = themeColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var countLabel:UILabel = {
        let label = UILabel()
        label.text = "\(count)"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = themeColor
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setOffTheme(){
        self.backgroundColor = UIColor(red: 229, green: 230, blue: 226)
        self.nameLabel.textColor = themeColor
        self.countLabel.textColor = themeColor
    }
    
    private func setOnTheme(){
        self.backgroundColor = themeColor
        self.nameLabel.textColor = .white
        self.countLabel.textColor = .white
    }
    
    init(title:String,count:Int,themeColor:UIColor){
        self.themeColor = themeColor
        self.title = title
        self.count = count
       
        super.init(frame:.zero)
 
        addViews()
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews(){
        self.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(countLabel)
    }
    
    private func setupUI(){
        self.backgroundColor =  UIColor(red: 229, green: 230, blue: 226)
        self.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            heightAnchor.constraint(equalTo: widthAnchor),
            stackView.heightAnchor.constraint(equalTo: heightAnchor, constant:-20)
        ])
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            countLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }
    public func toggleButtonState(){
        if self.isOn == 0{
            self.isOn = 1
            setOnTheme()
        } else {
            self.isOn = 0
            setOffTheme()
        }
        self.setNeedsDisplay()
    
    }
}
