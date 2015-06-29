//
//  UILayoutGuide.swift
//  FormationLayout
//
//  Created by Evan on 29/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

@available(iOS 9.0, *)
extension UILayoutGuide: View {
    public func prepareForLayout() {
    }
    
    public func isEqualTo(other: View) -> Bool {
        guard let other = other as? UILayoutGuide else { return false }
        return other == self
    }
    
    public var container: Container? {
        return owningView
    }
    
    public func addToContainer(container: Container, forceMove: Bool = false) {
        guard let container = container as? UIView where container != owningView else { return }
        if owningView == nil || forceMove {
            container.addLayoutGuide(self)
        }
    }
}