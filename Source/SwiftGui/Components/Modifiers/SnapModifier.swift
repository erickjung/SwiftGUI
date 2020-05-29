//
//  SnapModifier.swift
//  SwiftGui
//
//  Created by Erick Jung on 30/05/2020.
//  Copyright © 2020 Erick Jung. All rights reserved.
//

import Foundation

public protocol SnapModifier: class {

    var snapWidth: Bool? { get set }

    func snap() -> Self
}

public extension SnapModifier {

    func snap() -> Self {

        self.snapWidth = true
        return self
    }
}
