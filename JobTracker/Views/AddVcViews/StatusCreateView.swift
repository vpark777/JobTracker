//
//  StatusCreateView.swift
//  JobTracker
//
//  Created by Victoria Park on 11/3/21.
//

import UIKit

class StatusCreateView: UIView {

    //MARK: UI Component Declarations
    var selectedStatus:Int = 0
    weak var interviewDateDelegate:InterviewDateViewable?
    
    let buttonsStack:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var openButton:CheckToggleButton = {
        let button = CheckToggleButton(themeColor: UIColor(red: 96, green: 150, blue: 186))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction {[unowned self] in
            //switch on if off
            button.toggleOn()
            appliedButton.toggleOff()
            interviewButton.toggleOff()
            closedButton.toggleOff()
            selectedStatus = 0
            interviewDateDelegate?.hideInterviewDateView()
        }
        return button
    }()
    
    lazy var appliedButton:CheckToggleButton = {
        let button = CheckToggleButton(themeColor:UIColor(red: 144, green: 190, blue: 109) )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction {[unowned self] in
            //switch on if off
            button.toggleOn()
            openButton.toggleOff()
            interviewButton.toggleOff()
            closedButton.toggleOff()
            selectedStatus = 1
            //make interview date field invisible
            interviewDateDelegate?.hideInterviewDateView()
        }
        return button
    }()
    
    lazy var interviewButton:CheckToggleButton = {
        let button = CheckToggleButton(themeColor:UIColor(red: 248, green: 150, blue: 30))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction {[unowned self] in
            //switch on if off
            button.toggleOn()
            openButton.toggleOff()
            appliedButton.toggleOff()
            closedButton.toggleOff()
            selectedStatus = 2
            //make interview date field visible
            interviewDateDelegate?.showInterviewDateView()
        }
        return button
    }()
    lazy var closedButton:CheckToggleButton = {
        let button = CheckToggleButton(themeColor:.gray)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction {[unowned self] in
            //switch on if off
            button.toggleOn()
            openButton.toggleOff()
            appliedButton.toggleOff()
            interviewButton.toggleOff()
            selectedStatus = 3
            //make interview date field invisible
            interviewDateDelegate?.hideInterviewDateView()
        }
        return button
    }()
    
//MARK: Initializers
 
    init(interviewDateDelegate:InterviewDateViewable){
        super.init(frame:.zero)
        self.interviewDateDelegate = interviewDateDelegate
        addSubviews()
        activateConstraints()
        setInitialStatusState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setInitialStatusState(){
        openButton.toggleOn()
        appliedButton.toggleOff()
        interviewButton.toggleOff()
        closedButton.toggleOff()
        interviewDateDelegate?.hideInterviewDateView()
    }
    private func addSubviews(){
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
    public func markStatus(status:Int){
        let bArray = [openButton,appliedButton,interviewButton,closedButton]
        var count = 0
        for button in bArray{
            if status == count{
                bArray[count].toggleOn()
            } else {
                bArray[count].toggleOff()
            }
            count += 1
        }
        selectedStatus = status
        if status == 2{
            interviewDateDelegate?.showInterviewDateView()
        } else {
            interviewDateDelegate?.hideInterviewDateView()
        }
    }
}
