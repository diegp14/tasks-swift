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
    
    @Environment(\.modelContext)
    private var context
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(tasks){
                    task in
                    NavigationLink(destination:
                                    EditTaskView(task: task) ){
                        TaskRow(task: task)
                    }
                    
                }
                .onDelete(perform: removeTasks)
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
    private func removeTasks(at indexSet: IndexSet){
        do{
            for index in indexSet{
                context.delete(tasks[index])
            }
            try context.save()
        }catch{
            
        }
        }
    }
    
    


#Preview(traits: .sampleData) {
    ContentView()
}

