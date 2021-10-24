//
//  StatusFilterView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/22/21.
//

import UIKit

class StatusFilterView: UIView {
    
    private let filtersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 9
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let openStatusTile: StatusTileView = {
        let tileView = StatusTileView()
        tileView.statusTitleText = "open"
        tileView.statusNumber = 0
        tileView.textColor = UIColor(named: "Sky")
        tileView.translatesAutoresizingMaskIntoConstraints = false
        return tileView
    }()
    
    private let appliedStatusTile: StatusTileView = {
        let tileView = StatusTileView()
        tileView.statusTitleText = "applied"
        tileView.statusNumber = 0
        tileView.textColor = UIColor(named: "Moss")
        tileView.translatesAutoresizingMaskIntoConstraints = false
        return tileView
    }()
    
    private let interviewStatusTile: StatusTileView = {
        let tileView = StatusTileView()
        tileView.statusTitleText = "interview"
        tileView.statusNumber = 0
        tileView.textColor = UIColor(named: "Peach")
        tileView.translatesAutoresizingMaskIntoConstraints = false
        return tileView
    }()
    
    private let closedStatusTile: StatusTileView = {
        let tileView = StatusTileView()
        tileView.statusTitleText = "closed"
        tileView.statusNumber = 0
        tileView.textColor = UIColor(named: "Ash")
        tileView.translatesAutoresizingMaskIntoConstraints = false
        return tileView
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
        filtersStackView.addArrangedSubview(openStatusTile)
        filtersStackView.addArrangedSubview(appliedStatusTile)
        filtersStackView.addArrangedSubview(interviewStatusTile)
        filtersStackView.addArrangedSubview(closedStatusTile)
        addSubview(filtersStackView)
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            filtersStackView.topAnchor.constraint(equalTo: topAnchor),
            filtersStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            filtersStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            filtersStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
