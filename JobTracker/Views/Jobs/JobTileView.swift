//
//  JobTileView.swift
//  JobTracker
//
//  Created by Mayuko Inoue on 10/24/21.
//

import UIKit

class JobTileView: UICollectionViewCell {
    
    private let favoriteHeartView: UIImageView = {
        let heartImage = UIImageView()
        heartImage.image = UIImage(systemName: "heart.fill")
        heartImage.tintColor = UIColor(named: "Rose")
        heartImage.translatesAutoresizingMaskIntoConstraints = false
        return heartImage
    }()
    
    private let lastUpdatedBubbleView: LastUpdatedBubbleView = {
        let bubbleView = LastUpdatedBubbleView()
        bubbleView.translatesAutoresizingMaskIntoConstraints = false
        return bubbleView
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}
