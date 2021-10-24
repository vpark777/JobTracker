//
//  AddButtonView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/24/21.
//

import UIKit

class AddButtonView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.tintColor = UIColor(named: "Rose")
        button.contentHorizontalAlignment = .fill;
        button.contentVerticalAlignment = .fill;
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let spacingView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        stackView.addArrangedSubview(addButton)
        stackView.addArrangedSubview(spacingView)
        addSubview(stackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            addButton.heightAnchor.constraint(equalToConstant: 54),
            addButton.widthAnchor.constraint(equalToConstant: 54),
            
            spacingView.heightAnchor.constraint(equalToConstant: 20),
            spacingView.widthAnchor.constraint(equalToConstant: 5),
        ])
    }
}
