//
//  ContentView.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentURLString: String = "https://www.ya.ru"
    @State private var inputText: String = "https://www.ya.ru"
    
    var body: some View {
        ZStack {
            WebView(currentURLString: $currentURLString, initialURL: URL(string: currentURLString)!)
        
            
        }
        .toolbar{
            
            ToolbarItem(placement: .bottomBar) {
                Button(action:{
                    currentURLString = "https://www.ya.ru"
                }, label:{
                    Image(systemName: "house")
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
        //loadWebPage(url: url)
    }
    
    func createValidURL(from text: String) -> URL? {
        if let url = URL(string: text), ["http://", "https://"].contains(url.scheme?.lowercased() ?? "") {
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
        //loadWebPage(url: searchURL)
    }
}
        

#Preview {
    ContentView()
}
