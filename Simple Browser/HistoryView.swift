//
//  HistoryView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Query private var history: [Website]
    
    var body: some View {
        List{
            ForEach(history){ website in
             
                Text(website.url)
                
            }
        }
    }
}

#Preview {
    HistoryView()
}
