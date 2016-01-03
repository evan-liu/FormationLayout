//
//  DemoUtils.swift
//  FormationLayoutDemos
//
//  Created by Evan on 3/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit

func demoButton(title: String = "Button") -> UIButton {
    let btn = UIButton(type: .System)
    btn.setTitle(title, forState: .Normal)
    return btn
}

func demoLabel(text: String = "Label") -> UILabel {
    let label = UILabel()
    label.text = text
    label.numberOfLines = 0
    label.setContentCompressionResistancePriority(UILayoutPriorityDefaultLow, forAxis: .Horizontal)
    return label
}

func demoTextfield(text: String = "TextField") -> UITextField {
    let textField = UITextField()
    textField.placeholder = text
    return textField
}

func demoView(backgroundColor bgColor: UIColor) -> UIView {
    let view = UIView()
    view.backgroundColor = bgColor
    return view
}

func demoBackgroundColor(white: CGFloat = 0.95) -> UIColor {
    return UIColor(white: white, alpha: 1)
}
