//
//  EditTaskView.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/08/25.
//

import SwiftUI
import SwiftData

struct EditTaskView: View {
    @Environment(\.modelContext)
    private var context
    
    @Environment(\.dismiss)
    private var dismiss
    
    let task: Tasks
    
    private let isCreating: Bool
    private let title: String
    
    @State private var name: String
    @State private var detail: String
    @State private var status: StatusTask = .pending
    
    @State private var errorMessage = ""
    @State private var showError = false
    
    init(task: Tasks?){
        let taskToEdit: Tasks
        if let task {
            taskToEdit = task
            isCreating = false
            title = "Edit Task"
        }else {
            taskToEdit = Tasks(id: UUID(), name: "", detail: "", createdAt: .now, status: .pending)
            isCreating = true
            title = "Create Task"
        }
        self.task = taskToEdit
        self.name = taskToEdit.name
        self.detail = taskToEdit.detail
        self.status = taskToEdit.status
        
    }
    
    var body: some View {
       //Form for create a row in Tasks model
      NavigationStack {
          Form {
              Section {
                  TextField("Task", text: $name)
                  TextField("Detail", text: $detail)
                  Picker("Status", selection: $status) {
                      ForEach(StatusTask.allCases, id: \.self) {
                          Text($0.rawValue)
                      }
                  }
                  
              }
          }
          .navigationTitle(title)
          .toolbar {
              ToolbarItem(placement:.confirmationAction){
                  Button{
                      do {
                          try saveTask(name: name, detail: detail, status: status)
                      } catch {
                          errorMessage = "No se pudo guardar la tarea"
                          showError = true
                      }
                     
                      dismiss()
                  }
                  label: {
                      Text("Save")
                  }
                  .disabled(name.isEmpty || detail.isEmpty)
                  .alert("Error", isPresented: $showError){
                      Button("OK", role: .cancel){
                          
                      }
                  }message: {
                      Text(errorMessage)
                  }
              }
              ToolbarItem(placement: .cancellationAction){
                  Button{
                      dismiss()
                  } label: {
                     Text("Cancel")
                  }
              }
          }
        }
    }
    private func saveTask(name:String, detail:String, status:StatusTask) throws {
        task.name = name
        task.detail = detail
        task.status = status
        
        
        if isCreating {
            context.insert(task)
        }
        try context.save()
    }
}

#Preview(traits: .sampleData) {
    @Previewable @Query(sort: \Tasks.name) var tasks: [Tasks]
    EditTaskView(task: tasks[0])
}
