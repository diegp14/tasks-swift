//
//  Item.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/07/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
