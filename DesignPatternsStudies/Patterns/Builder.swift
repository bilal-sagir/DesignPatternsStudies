//
//  Builder.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 1.06.2024.
//

import Foundation
class BuilderStudy {

    static func htmlFormatterWithoutBuilder() {
        let hello = "hello"
        var result: String = "<p>\(hello) </p>"
        print(result)
        
        let words = ["hello", "world"]

        result = "<ul>\n"
        for word in words {
            result.append("<li>\(word)</li>\n")
        }
        result.append("</ul>")
        print(result)
    }
    
    static func htmlFormatterWithBuilderPattern() {
        let builder = HtmlBuilder(rootName: "ul")
        builder
            .addChildFluent(name: "li", text: "hello")
            .addChildFluent(name: "li", text: "word")
        print(builder)
    }
    
    static func personFacetedBuilderExample() {
        let personBuilder = PersonBuilder()
        let person = personBuilder
            .lives
                .at("Guzellik caddes")
                .inCity("İstanbul")
                .withPostcode("34343434")
            .works
                .asA("developer")
                .at("Google")
                .earning(300_000)
        
            .build()
        print(person)
    }
    
    static func exercise() {
        let cb = CodeBuilder("Person")
                    .addField(called: "name", ofType: "String")
                    .addField(called: "age", ofType: "Int")
        print(cb)
    }
}

// MARK: - Exercise
class CodeBuilder: CustomStringConvertible {
    let rootName: String
    var fields = [Field]()
    init(_ rootName: String) {
        self.rootName = rootName
    }
    
    func addField(called name: String, ofType type: String) -> CodeBuilder {
        fields.append(Field(name: name, type: type))
        return self
    }
    public var description: String {
        var result = ""
        result += "class \(rootName)\n"
        result += "{\n"
        for f in fields {
            result += "  var \(f.name): \(f.type)\n"
        }
        result += "}"
        return result
    }
}
struct Field {
    let name: String
    let type: String
}

// MARK: - Seconda Example (Facets Builder)

class Person: CustomStringConvertible {
    var streetAdress = "", postcode = "", city = ""
    var companyName = "", position = ""
    var annualIncome = 0
    
    var description: String {
        return "I live at \(streetAdress), \(postcode), \(city)." +
        "I work at \(companyName) as a \(position), earning \(annualIncome)."
    }
}

class PersonBuilder {
    var person = Person()
    var lives: PersonAddressBuilder {
        return PersonAddressBuilder(person)
    }
    var works: PersonJobBuilder {
        return PersonJobBuilder(person)
    }
    func build() -> Person {
        return person
    }
}

class PersonAddressBuilder: PersonBuilder {
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    @discardableResult func at(_ streetAddress: String) -> Self {
        person.streetAdress = streetAddress
        return self
    }
    
    @discardableResult func withPostcode(_ postcode: String) -> PersonAddressBuilder {
        person.postcode = postcode
        return self
    }
    
    @discardableResult func inCity(_ city: String) -> PersonAddressBuilder {
        person.city = city
        return self
    }
}

class PersonJobBuilder: PersonBuilder {
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    @discardableResult func at(_ companyName: String) -> Self {
        person.companyName = companyName
        return self
    }
    @discardableResult func asA(_ position: String) -> PersonJobBuilder {
        person.position = position
        return self
    }
    @discardableResult func earning(_ annualIncome: Int) -> PersonJobBuilder {
        person.annualIncome = annualIncome
        return self
    }
}


// MARK: - First Example
class HtmlElement: CustomStringConvertible {
    var name = ""
    var text = ""
    var elements = [HtmlElement]()
    private let indentSize = 2
    init() {}
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    private func description(_ indent: Int) -> String {
        var result = ""
        let i = String(repeating: " ", count: indent)
        result += "\(i)<\(name)>\n"
        if !text.isEmpty {
            result += String(repeating: " ", count: indentSize * (indent + 1))
            result += text
            result += "\n"
        }
        for e in elements {
            result += e.description(indent + 1)
        }
        result += "\(i)</\(name)>\n"
        return result
    }
    
    public var description: String {
        return description(0)
    }
}

class HtmlBuilder: CustomStringConvertible {
    private let rootName: String
    var root = HtmlElement()
    
    init(rootName: String) {
        self.rootName = rootName
        root.name = rootName
    }
    
    func addChild(name: String, text: String) {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
    }
    
    @discardableResult func addChildFluent(name: String, text: String) -> HtmlBuilder {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
        return self
    }
    
    var description: String {
        return root.description
    }
    
    func clear() {
        root = HtmlElement(name: rootName, text: "")
    }
}
