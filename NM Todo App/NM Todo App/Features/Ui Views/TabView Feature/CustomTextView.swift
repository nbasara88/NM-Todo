//
//  CustomTextView.swift
//  NM Todo App
//
//  Created by Marc Maguire on 2025-01-05.
//

import Foundation
import SwiftUI

struct CustomTextView: View {

    @Binding var randomInt: [Todo]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(randomInt, id: \.self) { todo in
                Text("My task is \(todo.task) and I have \(todo.time) to complete it.")
            }
            Spacer()
        }
    }
}

#Preview {
    CustomTextView(randomInt: .constant([Todo(id: UUID(), task: "test", time: 1)]))
}
