//
//  Item.swift
//  Shopping
//
//  Created by Sugabelly on 10/29/18.
//  Copyright © 2018 Lotanna Igwe-Odunze. All rights reserved.
//

import Foundation
import UIKit

//Grocery item model
struct ShoppingItem: Codable {
    
    var name: String
    var added: Bool
    var pictureName: String
    var picture: Data?
    
    init(name: String, pictureName: String) {
        self.name = name
        self.pictureName = pictureName
        self.added = false
    }
}



