//
//  UIView+FormationLayout.swift
//  FormationLayout
//
//  Created by Evan on 2/01/16.
//  Copyright © 2016 evancoding.com. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Create auto layout constraints with a `FormationLayout` taking `self` as `rootView`.
    public func layout(activateAddedFormations active: Bool = true) -> FormationLayout {
        return FormationLayout(rootView: self, activateAddedFormations: active)
    }
    
    /// Create auto layout constraints with a `FormationLayout` taking `self` as `rootView`.
    public func layout(activateAddedFormations active: Bool = true, @noescape block: (FormationLayout) -> Void) -> FormationLayout {
        let formationLayout = FormationLayout(rootView: self, activateAddedFormations: active)
        block(formationLayout)
        return formationLayout
    }
    
}
