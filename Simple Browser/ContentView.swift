//
//  ContentView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var currentURLString: String = "https://www.apple.com"
    @State private var inputText: String = "https://www.ya.ru"

    
    var body: some View {
        ZStack {
            WebView(currentURLString: $currentURLString, initialURL: URL(string: currentURLString)!)
            
            
        }
        .toolbar{
            
            ToolbarItem(placement: .bottomBar) {
                Button(action:{
                    print("Длина истории: -1")
                }, label:{
                    Image(systemName: "clock.fill")
                        
                })
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button(action:{
                    currentURLString = "https://www.ya.ru"
                }, label:{
                    Image(systemName: "house.fill")
                        
                })
            }
            
            ToolbarItem(placement: .bottomBar){
                HStack{
                    if currentURLString != "https://ya.ru/" {
                        
                        
                        TextField(
                            "Найдется все",
                            text: $inputText
                            
                        )
                        .disableAutocorrection(true)
                        .onSubmit {
                            loadRequest(from: inputText)
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
    
    
    
    func loadRequest(from text: String) {
        guard let url = createValidURL(from: text) else {
            print("Неверный URL. Выполняем поиск...")
            performSearch(query: text)
            return
        }
        
        currentURLString = url.absoluteString
    }
    
    func createValidURL(from text: String) -> URL? {
        if let url = URL(string: text), ["http://www.", "https://www.", "https://", "http://"].contains(url.scheme?.lowercased() ?? "") {
            return url
        }
        return nil
    }
    
    // Выполняем поиск через Яндекс
    func performSearch(query: String) {
        guard let searchURL = URL(string: "https://yandex.ru/search/?text=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            print("Ошибка формирования URL для поиска")
            return
        }
        currentURLString = searchURL.absoluteString
    }
}
        

#Preview {
    ContentView()
}
