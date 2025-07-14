//
//  NewTaskView.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/07/25.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.modelContext)
    private var context
    
    @Environment(\.dismiss)
    private var dismiss
    
    @State private var name: String = ""
    @State private var detail: String = ""
   
    @State private var status: StatusTask = .pending


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
          .navigationTitle("New Task")
          .toolbar {
              ToolbarItem(placement:.confirmationAction){
                  Button{
                      let newTask = Tasks(id: UUID(), name: name, detail: detail, createdAt: .now, status: status)
                      context.insert(newTask)
                      dismiss()
                  }
                  label: {
                      Text("Create")
                  }
                  .disabled(name.isEmpty || detail.isEmpty)
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
}

#Preview(traits: .sampleData) {
    NewTaskView()
}
