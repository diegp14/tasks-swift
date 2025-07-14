//
//  ContentView.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var tasks: [Tasks]
    @State private var showAddTaskView: Bool = false
    
    var body: some View {
        NavigationStack{
            List(tasks) {
                task in
                TaskRow(task: task)
            }
            .navigationTitle("Tasks")
            .toolbar{
                ToolbarItem(placement: .primaryAction) {
                    Button{
                        showAddTaskView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }
        .sheet(isPresented: $showAddTaskView){
            NewTaskView()
        }
    }
}

#Preview(traits: .sampleData) {
    ContentView()
}

