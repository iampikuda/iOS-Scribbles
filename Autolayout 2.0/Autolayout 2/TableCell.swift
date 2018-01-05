//
//  PageTableCell.swift
//  Autolayout 2
//
//  Created by Oluwadamisi Pikuda on 26/11/2017.
//  Copyright © 2017 Oluwadamisi Pikuda. All rights reserved.
//

import UIKit

public class TableCell: UITableViewCell {

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTextfield()
    }

    // Public Instance Variables
    public var bodyText: String? {
        didSet{
            guard let bodyText = bodyText else { return }
            
            let attributedText = NSAttributedString(string: bodyText, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor : UIColor.gray])
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
            descriptionTextView.isEditable = false
            descriptionTextView.isScrollEnabled = true

        }
    }

    // Private Instance Variables
    private let descriptionTextView: UITextView = {
        
        let textView = UITextView()

        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false

        return textView
        
    }()

    // Private Instance Methods
    private func setupTextfield() {
        
        addSubview(descriptionTextView)
        
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
