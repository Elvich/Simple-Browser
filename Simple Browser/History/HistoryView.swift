//
//  HistoryView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Binding var content: ContentModel
    
    @Query private var history: [Website]
    
    var body: some View {
        ZStack{
            List{
                ForEach(history.reversed()){ website in
                    
                    Button(action: {
                        content.currentURLString = website.url
                        content.state = .searching
                    }) {
                        Text(website.url)
                    }
                }
            }
            .gesture(
                DragGesture(minimumDistance: 50, coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.width > 0  {
                            content.state = .searching
                        }
                    })
            
            Text("Здесь будет история ваших посещенных сайтов")
                .font(.headline)
                .padding()
                .foregroundColor(.secondary)
                .opacity(history.isEmpty ? 1 : 0)

            
        }
    }
    
}
    



#Preview {
    ContentView()
}
