//
//  SearchingTests.swift
//  Simple BrowserTests
//
//  Created by Maksim Gritsuk on 23.04.2025.
//

import Testing
@testable import Simple_Browser

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

}
