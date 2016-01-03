//
//  UIView+FormationLayout.swift
//  FormationLayout
//
//  Created by Evan on 2/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit

extension UIView {

    /**
     Create a `FormationLayout` instance with `self` as `rootView`
     
     - parameters:
        - activateAddedFormations: Automaticly activate added constraints (default: true)
        - prepareForAutoLayout: Set `translatesAutoresizingMaskIntoConstraints` to false (default: false)
        - block: Block to create auto layout constraints with the created `FormationLayout`
     */
    public func layout(activateAddedFormations active: Bool = true, prepareForAutoLayout prepare: Bool = false, @noescape block: (FormationLayout) -> Void = {_ in}) -> FormationLayout {
        
        let formationLayout = FormationLayout(rootView: self, activateAddedFormations: active, prepareRootView: prepare)
        block(formationLayout)
        return formationLayout
    }
    
}
