//
//  TabView.swift
//  NM Todo App
//
//  Created by Coding on 2025-01-03.
//

import SwiftUI

struct Todo: Identifiable, Hashable {
    let id: UUID
    let task: String
    let time: Int
}

struct CustomTab: View {
    @State private var selectedTab = 0

    @State var todos: [Todo]

    var body: some View {
        ZStack {
            // Main TabView

            TabView(selection: $selectedTab) {
                CustomTextView(randomInt: $todos)
                    .tabItem {
                        Label("Today", systemImage: "calendar")
                    }
                    .tag(0)

                Text("Coming up")
                    .tabItem {
                        Label("Coming up", systemImage: "calendar.circle.fill")
                    }
                    .tag(1)
                
                Text("Search results")
                    .tabItem {
                        Label("search", systemImage: "magnifyingglass")
                    }
                    .tag(2)
                
                Text("Settings menu")
                    .tabItem {
                        Label("Settings", systemImage: "gearshape")
                    }
                    .tag(3)
            }

            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let timeToComplete = Int.random(in: 1...10)
                        todos.append(Todo(id: UUID(), task: "New Todo Task", time: timeToComplete))
                    }) {
                        Image(systemName: "plus")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(color: .gray.opacity(0.5), radius: 5, x: 0, y: 3)
                    }
                    .padding(.trailing, 19)
                    .padding(.bottom, 95)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    CustomTab(todos: [])
}
