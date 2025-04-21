//
//  ToolView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import SwiftUI

struct ToolView: View {
    
    @StateObject var viewModel: ToolViewModel
    
    @FocusState private var isTextFieldFocused: Bool

    
    var body: some View {
        VStack{
            Spacer()
            
            HStack{
                Spacer()
                
                if !isTextFieldFocused {
                    
                    
                    Button(action:{
                        viewModel.changeProgramState(.history)
                    }, label:{
                        Image(systemName: "clock.fill")
                    })
                    .padding(.leading)
                    
                    Spacer()
                }
                
                
                HStack{
                    if viewModel.tool.content.currentURLString != DefaultsManager.shared.getValue(forKey: "homeWebSite")! {
                        
                        
                        TextField(
                            "Найдется все",
                            text: $viewModel.tool.inputText
                        )
                        .focused($isTextFieldFocused)
                        .disableAutocorrection(true)
                        .onSubmit {
                            viewModel.changeCurrentURL(viewModel.tool.inputText)
                        }
                        .onChange(of: viewModel.tool.content.currentURLString) {
                            viewModel.tool.inputText = viewModel.tool.content.currentURLString
                        }
                        
                        
                        
                        if !viewModel.tool.inputText.isEmpty && isTextFieldFocused {
                            Button(action: {
                                viewModel.tool.inputText = ""}) {
                                    Image(systemName: "xmark.circle.fill")
                                }
                        }
                    }
                }
                .padding(.horizontal)
                
                if !isTextFieldFocused{
                    
                    Spacer()
                    
                    Button(action:{
                        viewModel.changeCurrentURL( DefaultsManager.shared.getValue(forKey: "homeWebSite")!)
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
