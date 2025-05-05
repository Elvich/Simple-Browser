//
//  ContentView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var content = ContentModel()    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        ZStack {
            WebView(currentURLString: $content.currentURLString, modelcontext: context)
                .cornerRadius(5)
                
            
            let tool = Tool(content: $content)
            let toolViewModel = ToolViewModel(tool: tool)
            
            ToolView(viewModel: toolViewModel)
            
            
        }
        .sheet(isPresented: Binding(
            get: { self.content.state == .history },
            set: { if !$0 { self.content.state = .searching } }
        )) {
            HistoryView(content: $content)
        }
    }
}
        

#Preview {
    ContentView()
}
