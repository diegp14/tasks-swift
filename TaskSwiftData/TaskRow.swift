//
//  TaskRow.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/07/25.
//
import SwiftUI


struct TaskRow: View {
    let task: Tasks
    var body: some View {
        VStack(alignment: .leading) {
            Text(task.name)
                .font(.headline)
            HStack {
                Text(task.createdAt.formatted(date: .long, time: .omitted))
                Spacer()
                Text(task.status.rawValue)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
        }
    }
}
