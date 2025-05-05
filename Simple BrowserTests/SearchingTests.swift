//
//  SearchingTests.swift
//  Simple BrowserTests
//
//  Created by Maksim Gritsuk on 23.04.2025.
//

import Testing
@testable import Simple_Browser
import Foundation

struct SearchingTests {

    let search = Searching()

    @Test(arguments: [("www.google.com", "https://www.google.com"), ("https://www.youtube.com", "https://www.youtube.com"), ("ya.ru", "https://ya.ru"), ("vk", "https://yandex.ru/search/?text=vk")])
    func testLoadRequest(_ input: String, _ output: String) async throws {
        #expect(search.loadRequest(from: input) == output)
    }
    
    @Test(arguments: [("www.google.com", false), ("https://www.youtube.com", true), ("ya.ru", false), ("vk", false)])
    func testperformSearch(_ input: String, _ output: Bool) async throws {
        #expect(search.checkValidURL(input) == output)
    }
    
    @Test(arguments: [("google", "https://yandex.ru/search/?text=google"), ("YouTube", "https://yandex.ru/search/?text=YouTube"), ("яндекс", "https://yandex.ru/search/?text=%D1%8F%D0%BD%D0%B4%D0%B5%D0%BA%D1%81")])
    func testPerformSearch(_ input: String, _ output: String) async throws {
        #expect(search.performSearch(query: input) == output)
    }
    
    @Test(arguments: [("google.com", URL(string: "https://google.com")), ("youtube.com", URL(string: "https://youtube.com")), ("яндекс", nil), ("", nil)])
    func testbuildingFullURL(_ input: String, _ output: URL?) async throws {
        #expect(search.buildingFullURL(from: input) == output)
    }

}
