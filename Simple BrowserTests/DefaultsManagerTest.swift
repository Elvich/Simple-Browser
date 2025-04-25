//
//  DefaultsManagerTest.swift
//  Simple BrowserTests
//
//  Created by Maksim Gritsuk on 26.04.2025.
//

import Testing
@testable import Simple_Browser

struct DefaultsManagerTest {

    @Test func testGetValue() async throws {
        #expect(DefaultsManager.shared.getValue(forKey: "test")!)
    }

}
