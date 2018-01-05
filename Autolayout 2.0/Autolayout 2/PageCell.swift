//
//  PageCell.swift
//  Autolayout 2
//
//  Created by Oluwadamisi Pikuda on 26/12/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Public Instance Variables
    public var page: PageModel? {
        didSet {
            addSubView()
            setupDescriptionTableView()
            setupLayout()
            descriptionTableView.register(TableCell.self, forCellReuseIdentifier: "textCell")

            guard let page = page else { return }

            currentImageView.image = UIImage(named: page.imageName)
            descriptionTableView.reloadData()
        }
    }

    // Private Instance Variables
    private lazy var currentImageView: UIImageView = {

        var imageView = UIImageView()

        guard let imageName = page?.imageName else { return imageView }

        imageView = UIImageView(image: UIImage(named: imageName))

        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView

    }()

    private let descriptionTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "headerCell")

        return tableView
    }()

    private let topImageContainerView: UIView = {

        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Private Instance Methods
    private func addSubView() {

        addSubview(descriptionTableView)

        addSubview(topImageContainerView)

        topImageContainerView.addSubview(currentImageView)

    }

    private func setupDescriptionTableView() {

        descriptionTableView.dataSource = self
        descriptionTableView.delegate = self
        descriptionTableView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTableView.separatorStyle = .none
        descriptionTableView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        descriptionTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -25).isActive = true
        descriptionTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true

    }

    private func setupLayout() {

        topImageContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true

        currentImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        currentImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor ).isActive = true
        currentImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.85).isActive = true
    }
    
}
