//
//  CheckToggleButton.swift
//  JobTracker
//
//  Created by Victoria Park on 11/2/21.
//

import UIKit

class CheckToggleButton: UIButton {

    let themeColor:UIColor?
    lazy var checkCircleView:UIImageView = {
        let view = UIImageView()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 65, weight: .bold, scale: .default)
        view.image = UIImage(systemName: "checkmark.circle",withConfiguration: largeConfig)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = themeColor
        view.backgroundColor = .white
         
        
        return view
    }()
    var isOn = 0 {
        didSet{
            if isOn == 0{
                checkCircleView.alpha = 0
            } else {
                checkCircleView.alpha = 1
            }
            self.setNeedsDisplay()
        }
    }
    
    init(themeColor:UIColor){
        self.themeColor = themeColor
        super.init(frame:.zero)
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        self.backgroundColor = themeColor
        self.addSubview(checkCircleView)
        
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.heightAnchor),
            checkCircleView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            checkCircleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75),
          
            checkCircleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            checkCircleView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        self.layoutIfNeeded()
        checkCircleView.layer.cornerRadius = checkCircleView.frame.width/2
      
    }
    
    public func toggleOn(){
        if self.isOn == 0{
            self.isOn = 1
            checkCircleView.alpha = 1
            //turn others off
            self.setNeedsDisplay()
        }
    }
    public func toggleOff(){
        self.isOn = 0
        self.setNeedsDisplay()
    }
}
