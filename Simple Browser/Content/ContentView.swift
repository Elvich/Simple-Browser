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
            
            switch content.state {
            case .searching:
                WebView(currentURLString: $content.currentURLString, modelcontext: context)
                
                let tool = Tool(content: $content)
                let toolViewModel = ToolViewModel(tool: tool)
                
                ToolView(viewModel: toolViewModel)
                
            case .history:
                //Устарели зависимости
                HistoryView(content: $content)
            }
            
            
        }
    }
}
        

#Preview {
    ContentView()
}
