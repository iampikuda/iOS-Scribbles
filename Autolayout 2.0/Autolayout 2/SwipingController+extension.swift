//
//  SwipingController+extension.swift
//  Autolayout 2
//
//  Created by Oluwadamisi Pikuda on 05/01/2018.
//  Copyright © 2018 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

extension SwipingController {

    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let x = targetContentOffset.pointee.x

        pageControl.currentPage = Int(x / view.frame.width)

        changeNavColour()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        super.viewWillTransition(to: size, with: coordinator)

        self.collectionView?.reloadData()

        coordinator.animate(alongsideTransition: { (_) in

            self.collectionViewLayout.invalidateLayout()

            if self.pageControl.currentPage == 0 {

                self.collectionView?.contentOffset = .zero

            } else {

                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)

                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
            }
        }) { (_) in }
    }
    private func changeNavColour() {

        pageControl.currentPage != 0 ?
            previousButton.setTitleColor(.activePink, for: .normal) :
            previousButton.setTitleColor(.gray, for: .normal)

        pageControl.currentPage == viewModel.pages.count - 1 ?
            nextButton.setTitleColor(.gray, for: .normal) :
            nextButton.setTitleColor(.activePink, for: .normal)
    }
}
