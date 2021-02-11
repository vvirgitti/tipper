//
//  TipperUITests.swift
//  TipperUITests
//
//  Created by Vanessa Virgitti on 28/01/2021.
//

import XCTest

class TipperUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()

    
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppHasTitle() throws {
        XCTAssert(app.staticTexts["Tip Calculator"].exists)
                
    }
    
    func testAppCanAddAmount() throws {
        let textField = app.textFields["Total"]
        textField.tap()
        
        textField.typeText("10")
        
        XCTAssertEqual(textField.value as! String, "010")
    }
    

    func testAppReturnCorrectTotalTipAmount() throws {

        app.textFields["Total"].tap()
        app.textFields["Total"].typeText("10")
        app.sliders.element.adjust(toNormalizedSliderPosition: 0.3)
        
        XCTAssert(app.staticTexts["£1.00"].exists)
        
    }
}
