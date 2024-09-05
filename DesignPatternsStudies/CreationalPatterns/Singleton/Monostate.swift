//
//  Monostate.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 5.09.2024.
//

import Foundation

class MonostateCEO: CustomStringConvertible {
    private static var _name = ""
    private static var _age = 0
    
    var name: String {
        get { Self._name }
        set(value) { Self._name = value}
    }
    
    var age: Int {
        get { Self._age }
        set(value) { Self._age = value}
    }
    
    public var description: String {
        return "\(name) is \(age) years old"
    }
}
