//
//  Website.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 14.04.2025.
//

import Foundation
import SwiftData

@Model
final class Website: Identifiable {
    var id: String
    var url: String
    var title: String?
    var date: Date
    
    init(url: String, title: String? = nil) {
        id = UUID().uuidString
        
        self.url = url
        self.title = title
        
        date = Date()
        let calendar = Calendar.current
        _ = calendar.component(.hour, from: date)
        _ = calendar.component(.minute, from: date)
    }
}
