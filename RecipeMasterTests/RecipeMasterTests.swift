//
//  RecipeMasterTests.swift
//  RecipeMasterTests
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

import XCTest
@testable import RecipeMaster

final class RecipeMasterTests: XCTestCase {

    var mock: RecipeMock!
    
    override func setUpWithError() throws {
        mock = RecipeMock()
    }

    override func tearDownWithError() throws {
        mock = nil
    }

    func testFetchRecipes() async {
        await mock.fetchRecipes()
        XCTAssertTrue(mock.didFetchRecipes)
        if case .success(let response) = mock.state {
            let expectation = Recipes(
                recipes: [
                    Recipe(
                        cuisine: "Italian",
                        name: "Bologness",
                        photoURLLarge: "",
                        photoURLSmall: "",
                        sourceURL: "",
                        uuid: "123",
                        youtubeURL: ""
                    )
                ]
            )
            XCTAssertEqual(response, expectation)
        }
    }

}
