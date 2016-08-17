//
//  ParallaxBackgroundView.swift
//  Parallax
//
//  Created by Steele, Trevor on 8/16/16.
//  Copyright © 2016 Trevor Steele. All rights reserved.
//

import Foundation
import UIKit

class ParallaxBackgroundView: UIView {
    var image: UIImage? {
        set(newValue) {
            imageView.image = newValue
        }
        get {
            return imageView.image
        }
    }
    
    private var imageView: UIImageView!
    private var imageTopConstraint: NSLayoutConstraint?
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        clipsToBounds = true
        
        imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        
        // layout
        imageTopConstraint = imageView.topAnchor.constraintEqualToAnchor(topAnchor)
        
        addConstraint(imageTopConstraint!)
        addConstraint(imageView.leadingAnchor.constraintEqualToAnchor(leadingAnchor))
        addConstraint(imageView.trailingAnchor.constraintEqualToAnchor(trailingAnchor))
        addConstraint(imageView.heightAnchor.constraintEqualToConstant(300))
    }
    
    func updateForView(view: UIView, inScrollView scrollView: UIScrollView) {
        if let parentView = scrollView.superview {
            // Convert the cell's frame to the parentView's coordinate space so we can determine its distance from the parentView's center
            let rect = scrollView.convertRect(view.frame, toView: parentView)
            let distanceFromCenter = parentView.frame.height / 2 - rect.origin.y
            
            // Calculate the height difference between the image view and the view
            let diff = imageView.frame.height - frame.height
            
            // Calculate the amount to shift the vertical position of the image view based on the parentView's distance from center and height delta
            let shiftY = (distanceFromCenter / parentView.frame.height) * diff
            
            // update top constraint for image view width new offset
            imageTopConstraint?.constant = -(diff / 2) + shiftY
            setNeedsLayout()
        }
    }
}