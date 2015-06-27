//
//  View+UIView.swift
//  FormationLayout
//
//  Created by Evan on 27/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

extension UIView: View {
    
    public func prepareForLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func isEqualTo(other: View) -> Bool {
        if let other = other as? UIView {
            return other == self
        }
        return false
    }
    
    public func addToContainer(container: Container, forceMove: Bool = false) {
        guard let container = container as? UIView else { return }
        if superview == nil || forceMove {
            container.addSubview(self)
        }
    }
    
}