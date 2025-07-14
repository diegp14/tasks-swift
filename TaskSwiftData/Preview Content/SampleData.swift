//
//  SampleData.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/07/25.
//


import Foundation
import SwiftData
import SwiftUI

struct SampleData: PreviewModifier {
    
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([Tasks.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)

        let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
        
        let task1 = Tasks(id: UUID(), name: "Tarea 1", detail: "Detalle de la Tarea 1", createdAt: .now, status: .pending)
        let task2 = Tasks(id: UUID(), name: "Tarea 2", detail: "Detalle de la Tarea 2", createdAt: .now, status: .pending)
        let task3 = Tasks(id: UUID(), name: "Tarea 3", detail: "Detalle de la Tarea 3", createdAt: .now, status: .inProgress)
        
        container.mainContext.insert(task1)
        container.mainContext.insert(task2)
        container.mainContext.insert(task3)
        
        
        return container
    }
    
    func body(content: Content, context: ModelContainer) -> some View {
            content.modelContainer(context)
        }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
