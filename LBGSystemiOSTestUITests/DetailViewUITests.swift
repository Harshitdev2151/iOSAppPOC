import XCTest

final class DetailViewUITests: XCTestCase {

    func test_navigationToDetail() {

        let app = XCUIApplication()
        app.launch()

        let post = app.staticTexts["postTitle"].firstMatch

        XCTAssertTrue(post.waitForExistence(timeout: 10))

        post.tap()

        XCTAssertTrue(app.navigationBars["Details"].exists)
    }
    
    func test_detailView_elementsExist() {

        let app = XCUIApplication()
        app.launch()

        // Navigate to detail screen
        // Wait for first cell
        let post = app.staticTexts["postTitle"].firstMatch

        XCTAssertTrue(post.waitForExistence(timeout: 10))

        post.tap()

        // Verify ID text exists
        XCTAssertTrue(app.staticTexts["postIDText"].exists)

        // Verify title text exists
        XCTAssertTrue(app.staticTexts["postTitleText"].exists)
    }
}
