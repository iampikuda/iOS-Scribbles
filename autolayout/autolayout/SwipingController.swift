//
//  SwipingController.swift
//  autolayout
//
//  Created by Oluwadamisi Pikuda on 05/11/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(imageName: "blueArrow", headerText: "All the things we claim to know!", bodyText: "Are you ready for loads and loads of fun? Let's see. I know nobody likes to watch anyone type because it's always very slow"),
        Page(imageName: "chevron-right", headerText: "Subscribe and get coupons on our daily events", bodyText: "Get nofified of the savings immediately when we announce them on our website. MAke sure to also give us any feedback you have"),
        Page(imageName: "black logo2", headerText: "VIP members special services", bodyText: "Joining the private club of elite customer will get you into select drawings and giveaways")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.backgroundColor = .white
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell

        let page = pages[indexPath.item]
        cell.page = page
//        cell.chevronImageView.image = UIImage(named: page.imageName)
//        cell.infoTextView.text = page.headerText
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
