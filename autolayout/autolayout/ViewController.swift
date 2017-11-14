//
//  ViewController.swift
//  autolayout
//
//  Created by Oluwadamisi Pikuda on 02/11/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var activePink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
    static var inactivePink = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
    
}

class ViewController: UIViewController {
    
    let topImageContainerView = UIView()
    
    let chevronImageView: UIImageView = {
        let imageView =  UIImageView(image: #imageLiteral(resourceName: "blueArrow"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let infoTextView: UITextView = {
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
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.activePink, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let controller = UIPageControl()
        controller.currentPage = 0
        controller.numberOfPages = 4
        controller.currentPageIndicatorTintColor = .activePink
        controller.pageIndicatorTintColor = .inactivePink
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(infoTextView)
        view.addSubview(topImageContainerView)
        
        setUpBottomControls()
        setUpPageLayout()
        
    }
    
    fileprivate func setUpBottomControls() {
        let bottomStackView = UIStackView(arrangedSubviews:
            [previousButton, pageControl, nextButton]
        )
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        
        view.addSubview(bottomStackView)
//        previousButton.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setUpPageLayout() {
        
//        topImageContainerView.backgroundColor = .red
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(chevronImageView)
        
        chevronImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        chevronImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        chevronImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        infoTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        infoTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        infoTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        infoTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

