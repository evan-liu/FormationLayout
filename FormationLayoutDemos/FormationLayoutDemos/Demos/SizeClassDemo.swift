//
//  SizeClassDemo.swift
//  FormationLayoutDemos
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit
import FormationLayout

class SizeClassDemo: UIViewController {
    
    var layouter: FormationLayout!
    
    override func viewDidLoad() {
        view.backgroundColor = demoBackgroundColor()
        
        let label = demoLabel("Email: ")
        let textfield = demoTextfield("Input here...")
        let button = demoButton("Submit")

        layouter = view.layout(activateAddedFormations: false)
        layouter.view(label).pinLeading(padding:10).top(topLayoutGuideView.bottom + 10)
        
        layouter.block {
            layouter.view(textfield).centerY(label).after(label + 10)
            layouter.view(button).leading(label).below(label + 10)
        }.install(.HRegular)
        
        layouter.block {
            layouter.view(textfield).leading(label).below(label + 10)
            layouter.view(button).leading(textfield).below(textfield + 10)
        }.install(.HCompact)
        
        layouter.activate(traitCollection)
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        layouter.activate(newCollection)
    }
    
}
