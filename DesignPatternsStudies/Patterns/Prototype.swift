//
//  Prototype.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 16.06.2024.
//

import Foundation

// A partially or fully initialized object that you copy(clone) and make use of
protocol Copying {
    init(copyFrom other: Self)
    func clone() -> Self
}
class Address: CustomStringConvertible, Copying {
    
    var streetAddress: String
    var city: String
    
    init(_ streetAddress: String, _ city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }
    
    required init(streetAddress: String, city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }
    
    required init(copyFrom other: Address) {
        streetAddress = other.streetAddress
        city = other.city
    }
    var description: String {
        return "\(streetAddress), \(city)"
    }
    
    func clone() -> Self {
        return Self(streetAddress: self.streetAddress, city: self.city)
        //return cloneImplementation()
    }
    
    private func cloneImplementation<T>() -> T { //what is the advantage of this approach? 
        return Address(streetAddress, city) as! T
    }
}
class Employee: CustomStringConvertible, Copying {
    var name: String
    var address: Address
    
    init(_ name: String, _ address: Address) {
        self.name = name
        self.address = address
    }
    
    required init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
    
    required init(copyFrom other: Employee) {
        name = other.name
        
        //1
        //address = Address(other.address.streetAddress, other.address.city)
        
        //2
        address = Address(copyFrom: other.address)
    }
    
    var description: String {
        return "My name is \(name) and I live at \(address)"
    }
    
    func clone() -> Self {
        let addressCopy = self.address.clone()
        return Self(name: self.name, address: addressCopy)
        //return cloneImplementation()
    }
    
    private func cloneImplementation<T>() -> T {
        return Employee(name, address) as! T
    }
}
