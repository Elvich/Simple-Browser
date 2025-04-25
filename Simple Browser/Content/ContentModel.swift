//
//  ContentModel.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 21.04.2025.
//

import Foundation

struct ContentModel{
    var state: ProgramState = .searching
    var currentURLString: String = DefaultsManager.shared.getValue(forKey: "standardWebSite")!
}
