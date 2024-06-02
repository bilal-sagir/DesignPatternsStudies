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
let machine = HotDrinkMachine()
print(machine.namedFactories.count)
let drink = machine.makeDrink()
drink.consume()

