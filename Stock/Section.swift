//
//  Section.swift
//  Stock
//
//  Created by Abigail Ng on 10/23/19.
//  Copyright © 2019 Abigail Ng. All rights reserved.
//

import Foundation

class Section: Equatable {
    var name: String
    var items: [Item]
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.items = []
        self.description = description
    }
    
    init() {
        self.name = "Unititled section"
        self.items = []
        self.description = ""
    }
    
    func addItem(item: Item) {
        self.items.append(item)
    }
    
    
    static func ==(lhs:Section, rhs:Section) -> Bool {
        return lhs.name == rhs.name
    }
    
}
