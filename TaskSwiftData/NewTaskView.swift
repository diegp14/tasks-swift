//
//  NewTaskView.swift
//  TaskSwiftData
//
//  Created by Diego Guzman on 13/07/25.
//

import SwiftUI

struct NewTaskView: View {



    var body: some View {
        //Form for create a row in Tasks model
        NavigationStack {
            EditTaskView(task: nil)
        }
    }
}

#Preview {
    NewTaskView()
}
