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
//var john = Employee("John", Address("123 Road", "Istanbul"))
//var chris = john
//chris.name = "Chris" //cant do this cuz we are using Class (reference type)
//chris.address = Address("124 Road", "London")
//print(john)
//print(chris)
//print("##############")

//Solution
//var tom = Employee("Tom", Address("100 Road", "Istanbul"))
//var adam = Employee(copyFrom: tom)
//adam.name = "Adam"
//adam.address = Address("101 Road", "London")
//print(tom)
//print(adam)
//print("##############")

//Solution for clone method
//var hugo = Employee("Hugo", Address("50 Road", "Istanbul"))
//var ivy = hugo.clone()
//ivy.name = "Ivy"
//ivy.address.city = "London"
//print(hugo)
//print(ivy)
//print("##############")

    // MARK: - Singleton

//let mydb = SingletonDatabase() -> cant initialize
//let db = SingletonDatabase.instance
//print(db.getPopulation(name: "Tokyo"))
//print(db.getPopulation(name: "Sao Paulo"))
//print(SingletonDatabase.intanceCount)

    // MARK: - Monostate

//let m1 = MonostateCEO()
//let m2 = MonostateCEO()
//m1.name = "bi"
//m1.age = 12
//m2.name = "yu"
//m2.age = 99
//print(m1)
//print(m2)

    //MARK: - Adapter
//
//func drawPoint(_ p: Pointt) {
//    print(".", terminator: "")
//}
//
//let vectorObjects = [
//    VectorRectangle(x: 1, y: 1, width: 10, height: 10),
//    VectorRectangle(x: 3, y: 3, width: 6, height: 6)
//]
//func draw() {
//    for vo in vectorObjects {
//        for line in vo {
//            let adapter = LineToPointAdapter(line)
//            adapter.forEach({ drawPoint($0)}) // why sequence protocol confirmed
//            //adapter.points.forEach({ drawPoint($0)})
//        }
//    }
//}
//draw()
