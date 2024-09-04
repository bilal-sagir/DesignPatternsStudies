//
//  SingletonTest.swift
//  SingletonTest
//
//  Created by Bilal on 4.09.2024.
//

import XCTest

final class SingletonTest: XCTestCase {
    final private class DummyDatabase: Database {
        func getPopulation(name: String) -> Int {
            return ["a": 1, "b": 2, "c": 3][name]!
        }
    }
    
    func test_singletonPopulationTest() {
        let rf = SingletonRecordFinder()
        let names = ["Sao Paulo", "Tokyo"]
        let tp = rf.totalPopulation(names: names)
        XCTAssertEqual(17_700_000 + 33_200_000, tp, "population size must match")
    }
    
    func test_isSingleton() {
        _ = SingletonDatabase.instance
        _ = SingletonDatabase.instance
        XCTAssertEqual(1, SingletonDatabase.intanceCount, "instance count must = 1")
    }
    
    func test_dependantTotalPopulationTest() { //didnt get the purpose
        let db = DummyDatabase()
        let rf = ConfigurableRecordFinder(database: db)
        XCTAssertEqual(4, rf.totalPopulation(names: ["a", "c"]))
    }
}
