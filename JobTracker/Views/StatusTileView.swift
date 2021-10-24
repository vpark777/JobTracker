//
//  StatusTileView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/22/21.
//

import UIKit

class StatusTileView: UIView {
    
    var textColor: UIColor? {
        didSet {
            if let textColor = textColor {
                titleLabel.textColor = textColor
                numberLabel.textColor = textColor
            }
        }
    }
    
    var statusTitleText: String = "" {
        didSet {
            let attributedString = NSMutableAttributedString(string: statusTitleText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: 1, range: NSRange(location: 0, length: attributedString.length))
            titleLabel.attributedText = attributedString
        }
    }
    
    var statusNumber: Int = 0 {
        didSet {
            numberLabel.text = "\(statusNumber)"
        }
    }
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

// MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(named: "Smoke")
        self.layer.cornerRadius = 20
        
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
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(numberLabel)
        addSubview(labelStackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            labelStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelStackView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 4),
            labelStackView.leadingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -4),
            
            heightAnchor.constraint(equalToConstant: 76),
        ])
    }
}
