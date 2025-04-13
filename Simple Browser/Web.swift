//
//  Web.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import Foundation
import WebKit
import SwiftUI
import SwiftData

struct WebView: UIViewRepresentable {
    @Binding var currentURLString: String
    let initialURL: URL
    
    let modelcontext: ModelContext
    
    // Явный публичный инициализатор
    public init(currentURLString: Binding<String>, initialURL: URL, modelcontext: ModelContext) {
        self._currentURLString = currentURLString
        self.initialURL = initialURL
        self.modelcontext = modelcontext
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        
        
        let request = URLRequest(url: initialURL)
        webView.load(request)
        
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: currentURLString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, modelContext: modelcontext)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        let modelContext: ModelContext
        
        init(_ parent: WebView, modelContext: ModelContext) {
            self.parent = parent
            self.modelContext = modelContext
        }
        
        // Метод для получения текущего URL при начале загрузки страницы
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            if let url = webView.url{
                if url == URL(string: parent.currentURLString)! { return }
                
                print("Новый URL: \(url)")
                
                let website = Website(url: url.absoluteString) // Создаем экземпляр класса Website
                modelContext.insert(website) // Сохраняем website в историю
                saveContext()
                
                parent.currentURLString = url.absoluteString // Обновляем currentURL в родительском представлении
            }
        }
        
        func saveContext() {
            do {
                try modelContext.save()
            } catch {
                print("Ошибка при сохранении: \(error)")
            }
        }
        
        // Метод для перехвата переходов (необязательно)
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            decisionHandler(.allow)
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            if let url = webView.url {
                print("Страница загружена: \(url.absoluteString)")
            }
        }
        
    }
    
}
