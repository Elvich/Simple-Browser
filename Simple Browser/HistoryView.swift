//
//  HistoryView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Binding var state: ProgramState
    
    @Query private var history: [Website]
    
    var body: some View {
        List{
            ForEach(history){ website in
                
                Text(website.url)
                
            }
        }
        .gesture(
            DragGesture(minimumDistance: 50, coordinateSpace: .local)
                .onEnded { value in
                    if value.translation.width > 0  {
                        state = .searching
                    }
                })
    }
    
}
    



#Preview {
    ContentView()
}
