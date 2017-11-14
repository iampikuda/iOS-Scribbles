//
//  PageCell.swift
//  autolayout
//
//  Created by Oluwadamisi Pikuda on 06/11/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let page = page else { return }
            chevronImageView.image = UIImage(named: page.imageName)
            
            let attributedText = NSMutableAttributedString(string: "All the things we claim to know!",
                                                           attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSAttributedString(string: "\n\n\n\(page.bodyText)",
                                                     attributes:  [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13 )]))
            
            infoTextView.attributedText = attributedText
            infoTextView.textAlignment = .center
        }
    }
    
    private let chevronImageView: UIImageView = {
        let imageView =  UIImageView(image: #imageLiteral(resourceName: "blueArrow"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let infoTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "All the things we claim to know!",
                                                       attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Let's see. I know nobody likes to watch anyone type because it's always very slow",
                                                 attributes:  [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13 )]))
        
        textView.attributedText = attributedText
        
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpPageLayout()
    }
    
    private func setUpPageLayout() {
        let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        addSubview(infoTextView)
        
        //        topImageContainerView.backgroundColor = .red
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(chevronImageView)
        
        chevronImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        chevronImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        chevronImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        infoTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        infoTextView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        infoTextView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        infoTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
