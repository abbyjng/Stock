//
//  Item
//  Stock
//
//  Created by Abigail Ng on 10/23/19.
//  Copyright © 2019 Abigail Ng. All rights reserved.
//

import Foundation

class Item: Equatable {
    var name: String
    var count: Int
    var description: String
    
    static func ==(lhs:Item, rhs:Item) -> Bool {
        return lhs.name == rhs.name
    }
    
    init(name: String, count: Int, description: String) {
        self.name = name
        self.count = count
        self.description = description
    }
    
    init() {
        self.name = "Untitled item"
        self.count = 0
        self.description = ""
    }
}
