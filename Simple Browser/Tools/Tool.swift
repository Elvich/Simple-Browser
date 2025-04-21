//
//  Tool.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 21.04.2025.
//

import Foundation
import SwiftUICore

struct Tool{
    @Binding var content: ContentModel
    var inputText: String = DefaultsManager.shared.getValue(forKey: "homeWebSite")!
}
