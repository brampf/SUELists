import XCTest
@testable import SUELists

final class SUEListsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SUELists().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
