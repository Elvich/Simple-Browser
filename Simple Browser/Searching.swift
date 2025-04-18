//
//  Searching.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 17.04.2025.
//

import Foundation

struct Searching {
    
    func loadRequest(from text: String) -> String? {
        guard let url = buildingFullURL(from: text) else {
            print("Неверный URL. Выполняем поиск...")
            return performSearch(query: text)
        }
        
        return url.absoluteString
    }
    
    private func checkValidURL(_ urlString: String) -> Bool {
        let regex = "^(https?://)([a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,}(\\/\\S*)?$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: urlString)
    }
    
    // Выполняем поиск через Яндекс
    private func performSearch(query: String) -> String? {
        guard let searchURL = URL(string: "https://yandex.ru/search/?text=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            print("Ошибка формирования URL для поиска")
            return nil
        }
        return searchURL.absoluteString
    }
    
    private func buildingFullURL(from input:String) -> URL? {
        
        var input = input.lowercased()
        let trimmedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedInput.isEmpty else {
            return nil
        }
        
        
        if checkValidURL(trimmedInput) {
            return URL(string: trimmedInput)
        }
        
        input = trimmedInput
        input = "https://" + input
        
        
        if checkValidURL(input){
            return URL(string: input)
        }
        
        return nil
    }
}
