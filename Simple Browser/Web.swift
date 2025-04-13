//
//  Web.swift
//  Simple Browser
//
//  Created by Maksim Gritsuk on 04.04.2025.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    @Binding var currentURLString: String
    let initialURL: URL
    
    // Явный публичный инициализатор
    public init(currentURLString: Binding<String>, initialURL: URL) {
        self._currentURLString = currentURLString
        self.initialURL = initialURL
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
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        // Метод для получения текущего URL при начале загрузки страницы
        func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
            if let url = webView.url {
                print("Новый URL: \(url)")
                parent.currentURLString = url.absoluteString // Обновляем currentURL в родительском представлении
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
