//
//  ContentView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var state: ProgramState = .searching
    
    @State private var currentURLString: String = DefaultsManager.shared.getValue(forKey: "standardWebSite")!
    
    @Environment(\.modelContext) private var context
    @Query private var history: [Website]
    
    var body: some View {
        ZStack {
            
            switch state {
            case .searching:
                WebView(currentURLString: $currentURLString, modelcontext: context)
                
                ToolView(currentURLString: $currentURLString)
            case .history:
                HistoryView()
            }
            
            
        }
    }
}
        

#Preview {
    ContentView()
}
