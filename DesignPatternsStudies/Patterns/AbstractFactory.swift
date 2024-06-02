//
//  AbstractFactory.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 2.06.2024.
//

import Foundation

protocol HotDrink {
    func consume()
}

class Tea: HotDrink {
    func consume() {
        print("Nice to have a tea.")
    }
}

class Coffee: HotDrink {
    func consume() {
        print("Nice to have a coffee.")
    }
}

protocol HotDrinkFactory {
    init()
    func prepareDrink(amount: Int) -> HotDrink
}

class TeaFactory: HotDrinkFactory {
    required init() {}
    func prepareDrink(amount: Int) -> HotDrink {
        print("Put in tea bag, pour \(amount) of boiled water.")
        return Tea()
    }
}

class CoffeeFactory: HotDrinkFactory {
    required init() {
        print(self)
    }
    func prepareDrink(amount: Int) -> HotDrink {
        print("Pour \(amount)ml of water on the grinded coffee beans.")
        return Coffee()
    }
}

class HotDrinkMachine {
    enum AvailableDrink: String {
        case coffee = "Coffee"
        case tea = "Tea"
        static let all = [coffee, tea]
    }
    
    internal var factories = [AvailableDrink: HotDrinkFactory]()
    internal var namedFactories = [(String, HotDrinkFactory)]()
    
    init() { // ? ? ? ? ?
        for drink in AvailableDrink.all {
            let type: AnyClass? = NSClassFromString("DesignPatternsStudies.\(drink.rawValue)Factory")
            let factory = (type as! HotDrinkFactory.Type).init()
            factories[drink] = factory
            namedFactories.append((drink.rawValue, factory))
        }
    }
    
    func makeDrink() -> HotDrink {
        print("Available drinks:")
        for i in 0..<namedFactories.count {
            let tuple = namedFactories[i]
            print("\(i): \(tuple.0)")
        }
        let input = Int(readLine()!)!
        return namedFactories[input].1.prepareDrink(amount: 250)
    }
}
