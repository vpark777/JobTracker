//
//  HeaderView.swift
//  JobTracker
//
//  Created by Victoria Park on 11/1/21.
//

import UIKit

class HeaderView: UICollectionReusableView {
    static let identifier = "FavoritesHeader"
    
    weak var favoriteFilterDelegate:FavoritesFilterDelegate?
    weak var resetStatusButtonsDelegate:ResetStatusButtonsDelegate?
    
    var favoritesButton:UIButton!
    var onConfiguration:UIButton.Configuration!
    var offConfiguration:UIButton.Configuration!
    
    override init(frame:CGRect){
        super.init(frame:frame)
        configureButton()
        addViews()
        activateConstraints()
    }
    
    func configureButton(){
     
        onConfiguration = UIButton.Configuration.filled()
        
        onConfiguration.title = "view all"
        onConfiguration.image = UIImage(systemName: "square.grid.2x2.fill")
        onConfiguration.imagePadding = 5
        onConfiguration.baseForegroundColor = .black
        onConfiguration.baseBackgroundColor = .white
        onConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        offConfiguration = UIButton.Configuration.filled()
        offConfiguration.title = "view favorites"
        offConfiguration.image = UIImage(systemName:"heart.fill")
        offConfiguration.baseForegroundColor = .white
        offConfiguration.baseBackgroundColor = UIColor(red: 236, green: 145, blue: 146)
        offConfiguration.imagePadding = 5
        offConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 20)
        favoritesButton = UIButton(configuration:offConfiguration,primaryAction:UIAction(){[unowned self] _ in
            
            resetStatusButtonsDelegate?.turnStatusButtonsOff()
            
            if let title = favoritesButton.configuration?.title{
                if title == "view favorites"{ //turning favorites filter on
                    favoritesButton.configuration = onConfiguration
                    favoriteFilterDelegate?.setFavoritesFilter(on: true)
                } else {
                    //turning favorites filter off
                    favoritesButton.configuration = offConfiguration
                    favoriteFilterDelegate?.setFavoritesFilter(on: false)
                }
            }
        })
        favoritesButton.translatesAutoresizingMaskIntoConstraints = false
        favoritesButton.layer.cornerRadius = 15
        favoritesButton.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews(){
        self.addSubview(favoritesButton)
    }
    
    func activateConstraints(){
        NSLayoutConstraint.activate([
            favoritesButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            favoritesButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            favoritesButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
