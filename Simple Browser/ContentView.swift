//
//  ContentView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentURLString: String = "https://www.ya.ru"
    var body: some View {
        ZStack {
            WebView(currentURLString: $currentURLString, initialURL: URL(string: currentURLString)!)
                        
            
            VStack{
                Spacer()
                
                HStack{
                    Spacer()
                    
                    if currentURLString != "https://www.ya.ru" {
                        
                        TextField(
                            "Адресная строка",
                            text: $currentURLString
                            
                        )
                        .disableAutocorrection(true)
                        
                        if !currentURLString.isEmpty {
                            Button(action: {
                                currentURLString = ""}) {
                                Image(systemName: "xmark.circle.fill")
                                }
                                .transition(AnyTransition.opacity.combined(with: .scale))
                                .animation(.easeOut(duration: 0.3), value: currentURLString.isEmpty)
                        }
                    }
                    
                    
                }
                .padding()
                .background(Color.black)
                .textFieldStyle(.roundedBorder)
            }
        }
    }
}

#Preview {
    ContentView()
}
