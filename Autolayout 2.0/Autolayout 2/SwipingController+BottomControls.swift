//
//  SwipingController.swift
//  Autolayout 2
//
//  Created by Oluwadamisi Pikuda on 24/12/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "pageCell")

        setupBottomControlLayout()

        collectionView?.backgroundColor = .white
        collectionView?.isPagingEnabled = true
    }

    // Public Instance Variables
    public lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = viewModel.pages.count
        pc.currentPageIndicatorTintColor = .activePink
        pc.pageIndicatorTintColor = .inactivePink
        return pc
    }()

    public let viewModel = ViewModel()

    // Private Instance Variables

    public let nextButton: UIButton = {
        let button = UIButton(type: .system)

        button.tag = 1
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.activePink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCellNav), for: .touchUpInside)

        return button
    }()

    public let previousButton: UIButton = {
        let button = UIButton(type: .system)

        button.tag = -1
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleCellNav), for: .touchUpInside)

        return button
    }()

    // Private Instance Methods
    @objc private func handleCellNav(_ sender: UIButton) {

        var navTo: Int?

        if sender.tag < 1 {

            navTo = max(pageControl.currentPage - 1, 0)
            pageControl.currentPage = navTo!

        } else {
            navTo = min(pageControl.currentPage + 1, viewModel.pages.count - 1)
            pageControl.currentPage = navTo!
        }
        guard let navToPath = navTo else { return }

        let indexPath = IndexPath(item: navToPath, section: 0)

        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)

        changeNavColour()
    }

    private func changeNavColour() {

        pageControl.currentPage != 0 ?
            previousButton.setTitleColor(.activePink, for: .normal) :
            previousButton.setTitleColor(.gray, for: .normal)

        pageControl.currentPage == viewModel.pages.count - 1 ?
            nextButton.setTitleColor(.gray, for: .normal) :
            nextButton.setTitleColor(.activePink, for: .normal)
    }

    private func setupBottomControlLayout() {

        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])

        view.addSubview(bottomControlsStackView)
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        bottomControlsStackView.axis = .horizontal

        bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}


