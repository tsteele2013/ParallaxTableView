//
//  MenuItemTableViewCell.swift
//  Parallax
//
//  Created by Steele, Trevor on 8/16/16.
//  Copyright © 2016 Trevor Steele. All rights reserved.
//

import Foundation
import UIKit

class MenuItemTableViewCell: UITableViewCell {
    var parallaxView: ParallaxBackgroundView!
    var titleLabel: UILabel!
    
    required override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfSize(18)
        titleLabel.textColor = .whiteColor()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        parallaxView = ParallaxBackgroundView()
        parallaxView.backgroundColor = UIColor(white: 0.5, alpha: 1)
        parallaxView.translatesAutoresizingMaskIntoConstraints = false
        contentView.insertSubview(parallaxView, atIndex: 0)
        
        // layout
        let views = ["parallaxView": parallaxView, "contentView": contentView]
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[parallaxView]|", options: .AlignAllTop, metrics: nil, views: views)
        contentView.addConstraints(horizontalConstraints)
        
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[parallaxView]|", options: .AlignAllLeft, metrics: nil, views: views)
        contentView.addConstraints(verticalConstraints)
        
        contentView.addConstraint(titleLabel.leadingAnchor.constraintEqualToAnchor(contentView.leadingAnchor, constant: 10))
        contentView.addConstraint(titleLabel.bottomAnchor.constraintEqualToAnchor(contentView.bottomAnchor, constant: -10))
    }
    
    func updateParallaxForScrollView(scrollView: UIScrollView) {
        parallaxView.updateForView(self, inScrollView: scrollView)
    }
    
}