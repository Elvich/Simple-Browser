//
//  Searching.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import Foundation

struct Searching {
    
    func loadRequest(from text: String) -> String? {
        guard let url = createValidURL(from: text) else {
            print("Неверный URL. Выполняем поиск...")
            return performSearch(query: text)
        }
        
        return url.absoluteString
    }
    
    private func createValidURL(from text: String) -> URL? {
        if let url = URL(string: text), ["http://www.", "https://www.", "https://", "http://"].contains(url.scheme?.lowercased() ?? "") {
            return url
        }
        return nil
    }
    
    // Выполняем поиск через Яндекс
    private func performSearch(query: String) -> String? {
        guard let searchURL = URL(string: "https://yandex.ru/search/?text=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            print("Ошибка формирования URL для поиска")
            return nil
        }
        return searchURL.absoluteString
    }
}
