//
//  DataModel.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/07/25.
//

import Foundation
import SwiftData

enum StatusTask: String, Codable, CaseIterable {
    case pending = "Pending"
    case inProgress = "In Progress"
    case completed = "Completed"
    
}

@Model
final class Tasks {
    @Attribute(.unique)
    var id: UUID
    var name: String
    var detail: String
    var createdAt: Date
    var status: StatusTask
    
    
    init(id: UUID, name: String, detail: String, createdAt: Date, status: StatusTask) {
        self.id = id
        self.name = name
        self.detail = detail
        self.createdAt = createdAt
        self.status = status
    }
    
    
    
    
    
}

