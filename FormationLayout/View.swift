//
//  View.swift
//  FormationLayout
//
//  Created by Evan on 27/06/15.
//  Copyright © 2015 evancoding.com. All rights reserved.
//

import Foundation

/// Type protocol for views.
public protocol View {
    
    func prepareForLayout()
    
    func isEqualTo(other: View) -> Bool
    
    var container: Container? { get }
    
    func addToContainer(container: Container, forceMove: Bool)
    
}