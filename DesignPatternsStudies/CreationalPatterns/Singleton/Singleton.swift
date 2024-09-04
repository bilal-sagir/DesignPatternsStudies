//
//  Singleton.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 3.09.2024.
//

import Foundation

protocol Database {
    func getPopulation(name: String) -> Int
}

class SingletonDatabase: Database {
    var capitals = ["Tokyo" : 33200000,
                    "New York" : 17800000,
                    "Sao Paulo" : 17700000]
    static var intanceCount = 0
    static var instance = SingletonDatabase()
    
    private init() {
        type(of: self).intanceCount += 1 // instanceCount += 1 ????
        print("initializing database")
    }
    
    func getPopulation(name: String) -> Int {
        return capitals[name] ?? 999999
    }
}

class SingletonRecordFinder {
    func totalPopulation(names: [String]) -> Int {
        return names.reduce(0) { total, name in
            total + SingletonDatabase.instance.getPopulation(name: name)
        }
    }
}

//Dependency Injection

class ConfigurableRecordFinder {
    let database: Database
    init(database: Database) {
        self.database = database
    }
    
    func totalPopulation(names: [String]) -> Int {
        names.reduce(0) { total, name in
            total + database.getPopulation(name: name)
        }
    }
}
