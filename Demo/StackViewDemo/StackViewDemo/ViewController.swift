//
//  ViewController.swift
//  StackViewDemo
//
//  Created by Evan on 5/07/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import UIKit
import FormationLayout

class ViewController: UIViewController {

    var layouter: FormationLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type: .System)
        btn.setTitle("Button", forState: .Normal)

        let label = UILabel()
        label.numberOfLines = 0
        label.text = "This is a test label for stack view."
        label.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
        
        let textField = UITextField()
        textField.text = "Text Field"
        
        let stack = GroupStackView(arrangedSubviews: [btn, label, textField])
        
        layouter = view.layout(activateAddedFormations: false) {
            $0.view(stack).center(view).size(300)
            
            let hCompactConfig = StackViewConfig(axis: .Horizontal, distribution: .EqualSpacing, alignment: .Center, spacing: 20)
            $0.stack(stack, config: hCompactConfig).install(.HCompact)
            
            var hRegularConfig = hCompactConfig
            hRegularConfig.axis = .Vertical
            $0.stack(stack, config: hRegularConfig).install(.HRegular)
            
            $0.activate(traitCollection)
        }
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layouter.activate(newCollection)
    }

}