//
//  SwipingController.swift
//  autolayout
//
//  Created by Oluwadamisi Pikuda on 05/11/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }) { (_) in
            
        }
        
    }
    
    let pages = [
        Page(imageName: "blueArrow", headerText: "All the things we claim to know!", bodyText: "Are you ready for loads and loads of fun? Let's see. I know nobody likes to watch anyone type because it's always very slow"),
        Page(imageName: "chevron-right", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you have"),
        Page(imageName: "black logo2", headerText: "VIP members special services", bodyText: "Joining the private club of elite customer will get you into select drawings and giveaways"),
        Page(imageName: "chevron-right", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you have"),
        Page(imageName: "black logo2", headerText: "VIP members special services", bodyText: "Joining the private club of elite customer will get you into select drawings and giveawaysJoining the private club of elite customer will get you into select drawings and giveawaysJoining the private club of elite customer will get you into select drawings and giveawaysJoining the private club of elite customer will get you into select drawings and giveawaysJoining the private club of elite customer will get you into select drawings and giveawaysJoining the private club of elite customer will get you into select drawings and giveawayGet nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you haveGet nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you haveGet nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you haveGet nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you haveGet nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you haveGet nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you haves")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.backgroundColor = .white
        
        collectionView?.isPagingEnabled = true
        
        setUpBottomControls()
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.activePink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleNext() {
        
        let nextIndex =  min(pageControl.currentPage + 1, pages.count - 1)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    @objc private func handlePrev() {
        
        let prevIndex =  max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: prevIndex, section: 0)
        pageControl.currentPage = prevIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    private lazy var pageControl: UIPageControl = {
        let controller = UIPageControl()
        controller.currentPage = 0
        controller.numberOfPages = pages.count
        controller.currentPageIndicatorTintColor = .activePink
        controller.pageIndicatorTintColor = .inactivePink
        return controller
    }()
    
    fileprivate func setUpBottomControls() {
        let bottomStackView = UIStackView(arrangedSubviews:
            [previousButton, pageControl, nextButton]
        )
        
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell

        let page = pages[indexPath.item]
        cell.page = page

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
