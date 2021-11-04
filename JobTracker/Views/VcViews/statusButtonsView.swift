//
//  statusButtonsView.swift
//  JobTracker
//
//  Created by Victoria Park on 10/31/21.
//

import UIKit

class StatusButtonsView: UIView {

    weak var filterDelegate:StatusFilterDelegate?
    
    let buttonsStack:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var openButton:StatusButton = {
        let button = StatusButton(title: "open", count:0, themeColor: UIColor(red: 96, green: 150, blue: 186))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction {[unowned self] in
            print("hello from open button")
            button.toggleButtonState()
            filterDelegate?.setNewStatusFilters(switches: [button.isOn,appliedButton.isOn,interviewButton.isOn,closedButton.isOn])
        }
     
        return button
    }()
    
    lazy var appliedButton:StatusButton = {
        let button = StatusButton(title: "applied", count:0, themeColor: UIColor(red: 144, green: 190, blue: 109))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction {[unowned self] in
            print("hello from applied button")
            button.toggleButtonState()
            filterDelegate?.setNewStatusFilters(switches: [openButton.isOn,button.isOn,interviewButton.isOn,closedButton.isOn])
        }
       
        return button
    }()
    
    lazy var interviewButton:StatusButton = {
        let button = StatusButton(title: "interview", count:0, themeColor: UIColor(red: 248, green: 150, blue: 30))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction { [unowned self] in
            print("hello from interview button")
            button.toggleButtonState()
            filterDelegate?.setNewStatusFilters(switches: [openButton.isOn,appliedButton.isOn,button.isOn,closedButton.isOn])
        }
        
        return button
    }()
    
    lazy var closedButton:StatusButton = {
        let button = StatusButton(title: "closed", count:0, themeColor:.gray)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction {[unowned self] in
            print("hello from closed button")
            button.toggleButtonState()
            filterDelegate?.setNewStatusFilters(switches: [openButton.isOn,appliedButton.isOn,interviewButton.isOn,button.isOn])
        }
        
        return button
    }()
    
    init(filterDelegate:StatusFilterDelegate? = nil){
        self.filterDelegate = filterDelegate
        super.init(frame:.zero)
        addViews()
        activateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        self.addSubview(buttonsStack)
        buttonsStack.addArrangedSubview(openButton)
        buttonsStack.addArrangedSubview(appliedButton)
        buttonsStack.addArrangedSubview(interviewButton)
        
        buttonsStack.addArrangedSubview(closedButton)
    }
    func activateConstraints(){
        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: topAnchor),
            buttonsStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonsStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonsStack.bottomAnchor.constraint(equalTo: bottomAnchor)
       ])
        
    }
    
    //open button pressed = toggle colors
    // call delegate function setNewFilters(switches:[Int])
}

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
}
