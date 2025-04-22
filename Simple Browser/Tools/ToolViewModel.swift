//
//  ToolViewModel.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 21.04.2025.
//

import Foundation

class ToolViewModel: ObservableObject {
    @Published var tool: Tool
    @Published var searching: Searching
    
    init(tool: Tool) {
        self.tool = tool
        self.searching = Searching()
    }
    
    func changeProgramState(_ newState:ProgramState ){
        tool.content.state = newState
    }
    
    func changeCurrentURL(_ newURL:String){
        tool.content.currentURLString = searching.loadRequest(from: newURL)!
    }
    
    func refillingInputString(){
        tool.inputText = tool.content.currentURLString
    }
}
