import XCTest

final class DetailViewUITests: XCTestCase {

    func test_navigationToDetail() {

        let app = XCUIApplication()
        app.launch()

        let postCard =
        app.buttons["postCard"].firstMatch

        XCTAssertTrue(
            postCard.waitForExistence(timeout: 10)
        )

        postCard.tap()

        XCTAssertTrue(
            app.navigationBars["Details"]
                .waitForExistence(timeout: 5)
        )
    }

    func test_detailView_elementsExist() {

        let app = XCUIApplication()
        app.launch()

        let postCard =
        app.buttons["postCard"].firstMatch

        XCTAssertTrue(
            postCard.waitForExistence(timeout: 10)
        )

        postCard.tap()

        XCTAssertTrue(
            app.staticTexts["postIDText"]
                .waitForExistence(timeout: 5)
        )

        XCTAssertTrue(
            app.staticTexts["postTitleText"]
                .waitForExistence(timeout: 5)
        )
    }
}
