//
//  ViewController.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/22/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let topStackView: UIStackView = { //The greeting, the add button, and the tiles
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let headerStackView: UIStackView = { //The greeting, the add button
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.alignment = .bottom
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let userGreetingView: UserGreetingView = {
        let greetingView = UserGreetingView()
        greetingView.translatesAutoresizingMaskIntoConstraints = false
        return greetingView
    }()
    
    let addButtonView: AddButtonView = {
        let addButton = AddButtonView()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        return addButton
    }()
    
    let statusFilterView: StatusFilterView = {
        let filterView = StatusFilterView()
        filterView.translatesAutoresizingMaskIntoConstraints = false
        return filterView
    }()
    
// MARK: - Initializers
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            
        setupUI()
        activateConstraints()
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        activateConstraints()
    }
    
// MARK: - UI Setup Functions
        
     func setupUI() {
         view.backgroundColor = .white
         
         headerStackView.addArrangedSubview(userGreetingView)
         headerStackView.addArrangedSubview(addButtonView)
         
         topStackView.addArrangedSubview(headerStackView)
         topStackView.addArrangedSubview(statusFilterView)
         
         view?.addSubview(topStackView)
    }

     func activateConstraints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

