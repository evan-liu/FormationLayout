//
//  CustomViewDemo.swift
//  FormationLayoutDemos
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit
import FormationLayout

class CustomViewDemo: UIViewController {
    override func loadView() {
        view = CustomView()
    }
}

class CustomView: UIView {
    init() {
        super.init(frame: CGRectZero)
        
        let bg = demoView(backgroundColor: demoBackgroundColor())
        let label = demoLabel("Email: ")
        let textfield = demoTextfield("Input here...")
        let button = demoButton("Submit")
        
        layout {
            $0.view(bg).fill()
            $0.view(label).pinLeading(padding:50).pinCenterY()
            $0.view(textfield).centerY(label).after(label + 10)
            $0.view(button).pinCenterX().below(label + 20)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
}