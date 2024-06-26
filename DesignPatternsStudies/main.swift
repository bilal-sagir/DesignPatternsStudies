//
//  main.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 1.06.2024.
//

import Foundation

    //MARK: - Builder
//BuilderStudy.htmlFormatterWithoutBuilder()
//BuilderStudy.htmlFormatterWithBuilderPattern()
//BuilderStudy.personFacetedBuilderExample()
//BuilderStudy.exercise()

    // MARK: - Factory
//let point = PointFactory.createPolar(rho: 1, theta: 2)
//let point2 = PointInnerFactory.factory.createCartesian(x: 1, y: 2)
//print(point)
//print(point2)

    // MARK: - AbstractFactory //didnt get the idea.
//let machine = HotDrinkMachine()
//print(machine.namedFactories.count)
//let drink = machine.makeDrink()
//drink.consume()

    // MARK: - Prototype

//Motivation
var john = Employee("John", Address("123 Road", "Istanbul"))
var chris = john
chris.name = "Chris" //cant do this cuz we are using Class (reference type)
chris.address = Address("124 Road", "London")
print(john)
print(chris)
print("##############")

//Solution
var tom = Employee("Tom", Address("100 Road", "Istanbul"))
var adam = Employee(copyFrom: tom)
adam.name = "Adam"
adam.address = Address("101 Road", "London")
print(tom)
print(adam)
print("##############")

//Solution for clone method
var hugo = Employee("Hugo", Address("50 Road", "Istanbul"))
var ivy = hugo.clone()
ivy.name = "Ivy"
ivy.address.city = "London"
print(hugo)
print(ivy)
print("##############")
