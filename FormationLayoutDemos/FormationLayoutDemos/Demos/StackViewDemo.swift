//
//  StackViewDemoViewController.swift
//  FormationLayoutDemos
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import FormationLayout

class StackViewDemo: UIViewController {
    
    var layouter: FormationLayout?
    
    override func loadView() {
        view = demoView(backgroundColor: UIColor.whiteColor())
    }
    
    override func viewDidLoad() {
        let stack = GroupStackView(arrangedSubviews: [
            demoButton(),
            demoLabel("Try to rotate the device or simulator"),
            demoTextfield()
        ])
        
        layouter = view.layout(activateAddedFormations: false) {
            $0.view(stack).size(300).pinCenter()
            
            let hCompactConfig = StackViewConfig(distribution: .EqualSpacing, alignment: .Center, spacing: 20)
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
