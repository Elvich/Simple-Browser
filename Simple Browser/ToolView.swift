//
//  ToolView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import SwiftUI

struct ToolView: View {
    
    @Binding var state: ProgramState
    
    @Binding var currentURLString: String
    @State private var inputText: String = DefaultsManager.shared.getValue(forKey: "homeWebSite")!
    
    private let searching = Searching()
    
    @FocusState private var isTextFieldFocused: Bool

    
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                Spacer()
                
                if !isTextFieldFocused {
                    
                    
                    Button(action:{
                        state = .history
                    }, label:{
                        Image(systemName: "clock.fill")
                    })
                    .padding(.leading)
                    
                    Spacer()
                }
                
                
                HStack{
                    if currentURLString != DefaultsManager.shared.getValue(forKey: "homeWebSite")! {
                        
                        
                        TextField(
                            "Найдется все",
                            text: $inputText
                            
                        )
                        .focused($isTextFieldFocused)
                        .disableAutocorrection(true)
                        .onSubmit {
                            currentURLString = searching.loadRequest(from: inputText)!
                        }
                        .onChange(of: currentURLString) {
                            inputText = currentURLString
                        }
                        
                        
                        
                        if !inputText.isEmpty && isTextFieldFocused {
                            Button(action: {
                                inputText = ""}) {
                                    Image(systemName: "xmark.circle.fill")
                                }
                        }
                    }
                }
                .padding(.horizontal)
                
                if !isTextFieldFocused{
                    
                    Spacer()
                    
                    Button(action:{
                        currentURLString = DefaultsManager.shared.getValue(forKey: "homeWebSite")!
                    }, label:{
                        Image(systemName: "house.fill")
                        
                    })
                    .padding(.trailing)
                }
                
                Spacer()

            }
            .padding(.top)
            .background(Color("BackAccentColor"))
        }
    }
}

#Preview {
    ContentView()
}
