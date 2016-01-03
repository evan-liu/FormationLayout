//
//  StackViewDemoViewController.swift
//  FormationLayoutDemos
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit
import FormationLayout

class StackViewDemoViewController: UIViewController {
    
    var layouter: FormationLayout?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad() {
        let btn = UIButton(type: .System)
        btn.setTitle("Button", forState: .Normal)
        
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Try to rotate the device or simulator"
        label.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
        
        let textField = UITextField()
        textField.text = "TextField"
        
        let stack = GroupStackView(arrangedSubviews: [btn, label, textField])
        
        layouter = view.layout(activateAddedFormations: false) {
            $0.view(stack).size(300).pinCenter()
            
            let hCompactConfig = StackViewConfig(axis: .Horizontal, distribution: .EqualSpacing, alignment: .Center, spacing: 20)
            $0.stack(stack, config: hCompactConfig).install(.HCompact)
            
            var hRegularConfig = hCompactConfig
            hRegularConfig.axis = .Vertical
            $0.stack(stack, config: hRegularConfig).install(.HRegular)
            
            $0.activate(traitCollection)
        }
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layouter?.activate(newCollection)
    }
    
}
