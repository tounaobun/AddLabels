//
//  ViewController.swift
//  AddMultipleLabels
//
//  Created by Benson on 15/5/26.
//  Copyright (c) 2015年 Benson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    let containerHeight: CGFloat = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.backgroundColor = UIColor.blueColor()
        
    }
    
    @IBAction func addAnotherLabel() {
        
        let label = UILabel()
        label.textColor = .whiteColor()
        label.setTranslatesAutoresizingMaskIntoConstraints(false)

        containerView.removeConstraints(containerView.constraints())    // remove all constraints.
    
        // container view position center in view.
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1.0, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: containerView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: containerHeight))
        
        containerView.addSubview(label)
        
        var viewDict = [NSObject: AnyObject]()
        var VFL = "|"
        
        for (index,addedLabel) in enumerate(containerView.subviews) {
            
            label.text = "label\(index)"
            viewDict["label\(index)"] = addedLabel
            VFL += "-0-[label\(index)]"
            
            if index == containerView.subviews.count - 1 {
                VFL += "-0-|"
            }
            // align label center vertically
            containerView.addConstraint(NSLayoutConstraint(item: addedLabel, attribute: .CenterY, relatedBy: .Equal, toItem: containerView, attribute: .CenterY, multiplier: 1.0, constant: 0))
            
        }
        
        println(VFL)
        
        containerView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(VFL, options: NSLayoutFormatOptions.AlignAllCenterY, metrics: nil, views: viewDict))
        
    }

}

