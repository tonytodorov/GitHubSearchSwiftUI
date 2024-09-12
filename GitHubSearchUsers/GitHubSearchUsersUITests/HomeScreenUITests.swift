//
//  HomeScreenUITests.swift
//  GitHubSearchUsersUITests
//
//  Created by Aurora on 28.08.24.
//

import XCTest
@testable import GitHubSearchUsers

final class HomeScreenUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func testSearchFieldGetCorrectValue() {
        let searchField = app.searchFields["Enter name"]
        XCTAssertTrue(searchField.exists)
        
        searchField.tap()
        searchField.typeText("asd")
        
        app.keyboards.buttons["Search"].tap()
        
        let searchFieldValue = searchField.value as? String
        XCTAssertEqual(searchFieldValue, "asd")
    }
    
    func testSearchFieldReturnWrongValue() {
        let searchField = app.searchFields["Enter name"]
        XCTAssertTrue(searchField.exists)
        
        searchField.tap()
        searchField.typeText("asd")
        
        app.keyboards.buttons["Search"].tap()
        
        let searchFieldValue = searchField.value as? String
        XCTAssertNotEqual(searchFieldValue, "fsd")
    }
    
}

