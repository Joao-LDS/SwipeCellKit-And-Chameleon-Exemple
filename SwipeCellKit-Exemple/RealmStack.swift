//
//  RealmStack.swift
//  SwipeCellKit-Exemple
//
//  Created by João on 31/01/21.
//  Copyright © 2021 João Luis Santos. All rights reserved.
//

import Foundation
import RealmSwift

class Line: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
}

class RealmStack {
    
    static let shared = RealmStack()
    let realm = try! Realm()
    
    func save(_ Line: Line) {
        do {
            try realm.write {
                realm.add(Line)
            }
        } catch let error as NSError {
            debugPrint(error.description)
        }
    }
    
    func update(_ line: Line) {
        try! realm.write({
            realm.delete(line)
        })
    }
    
    func requestLines() -> Results<Line>? {
        let lines = realm.objects(Line.self)
        return lines
    }
    
    func loadLinesObject() -> [Line] {
        guard let request = requestLines() else { return [] }
        var lines: [Line] = []
        for line in request {
            lines.append(line)
        }
        return lines
    }
}
