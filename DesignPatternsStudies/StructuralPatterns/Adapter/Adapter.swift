//
//  Adapter.swift
//  DesignPatternsStudies
//
//  Created by Bilal on 5.09.2024.
//

import Foundation
class Pointt: CustomStringConvertible {
    var x: Int
    var y: Int
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
    
    var description: String {
        "X = \(x), Y = \(y)"
    }
}
class Line {
    var start: Pointt
    var end: Pointt
    
    init(start: Pointt, end: Pointt) {
        self.start = start
        self.end = end
    }
}

class VectorObject: Sequence {
    var lines = [Line]()
    
    func makeIterator() -> IndexingIterator<Array<Line>> {
        IndexingIterator(_elements: lines)
    }
}

class VectorRectangle: VectorObject {
    init(x: Int, y: Int, width: Int, height: Int) {
        super.init()
        lines.append(Line(start: .init(x, y), end: .init(x + width, y)))
        lines.append(Line(start: .init(x + width, y), end: .init(x + width, y + height)))
        lines.append(Line(start: .init(x, y), end: .init(x, y + height)))
        lines.append(Line(start: .init(x, y + height), end: .init(x + width, y + height)))
    }
}

class LineToPointAdapter: Sequence {
    private static var count = 0
    var points = [Pointt]() // if we are using sequence protocol, we must make this private? otherwise what is the purpose
    
    init(_ line: Line) {
        Self.count += 1
        print("\(Self.count): Generating points for line", "[\(line.start.x), \(line.start.y)] - [\(line.end.x), \(line.end.y)]")
        
        let left = Swift.min(line.start.x, line.end.x)
        let right = Swift.max(line.start.x, line.end.x)
        let top = Swift.min(line.start.y, line.end.y)
        let bottom = Swift.max(line.start.y, line.end.y)
        let dx = right - left
        let dy = line.end.y - line.start.y
        
        if dx == 0 {
            for y in top...bottom {
                points.append(Pointt(left, y))
            }
        } else if dy == 0 {
            for x in left...right {
                points.append(Pointt(x, top))
            }
        }
    }
    
    func makeIterator() -> IndexingIterator<Array<Pointt>> {
        return IndexingIterator(_elements: points)
    }
}
