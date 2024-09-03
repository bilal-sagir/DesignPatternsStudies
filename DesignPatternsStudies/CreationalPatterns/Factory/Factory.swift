//
//  Factory.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 2.06.2024.
//

import Foundation

class Point: CustomStringConvertible {
    private let x, y : Double
    
    fileprivate init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    fileprivate init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }
    
    var description: String {
       return "x= \(x), y= \(y)"
    }
}

class PointFactory {
    static func createCartesian(x: Double, y: Double) -> Point {
        return Point(x: x, y: y)
    }
    
    static func createPolar(rho: Double, theta: Double) -> Point {
        return Point(rho: rho, theta: theta)
    }
}

// MARK: - InnerFactory

class PointInnerFactory: CustomStringConvertible {
    private let x, y : Double
    
    private init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    private init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }
    
    var description: String {
       return "x= \(x), y= \(y)"
    }
    
    static let factory = PointFactory.instance
    
    class PointFactory {
        
        private init() { }
        static let instance = PointFactory()
        
        func createCartesian(x: Double, y: Double) -> Point {
            return Point(x: x, y: y)
        }
        
        func createPolar(rho: Double, theta: Double) -> Point {
            return Point(rho: rho, theta: theta)
        }
    }
}
