//
//  ToolView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import SwiftUI

struct ToolView: View {
    
    @Binding var currentURLString: String
    @State private var inputText: String = DefaultsManager.shared.getValue(forKey: "homeWebSite")!
    
    private let searching = Searching()

    
    var body: some View {
        VStack{
            Spacer()
        }
        .toolbar{
            
            ToolbarItem(placement: .bottomBar) {
                Button(action:{
                    
                }, label:{
                    Image(systemName: "clock.fill")
                        
                })
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button(action:{
                    currentURLString = DefaultsManager.shared.getValue(forKey: "homeWebSite")!
                }, label:{
                    Image(systemName: "house.fill")
                    
                })
            }
            
            ToolbarItem(placement: .bottomBar){
                HStack{
                    if currentURLString != DefaultsManager.shared.getValue(forKey: "homeWebSite")! {
                        
                        
                        TextField(
                            "Найдется все",
                            text: $inputText
                            
                        )
                        .disableAutocorrection(true)
                        .onSubmit {
                            currentURLString = searching.loadRequest(from: inputText)!
                        }
                        .onChange(of: currentURLString) { newValue in
                            inputText = newValue
                        }
                        
                        Spacer()
                        
                        if !inputText.isEmpty {
                            Button(action: {
                                inputText = ""}) {
                                    Image(systemName: "xmark.circle.fill")
                            }
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
