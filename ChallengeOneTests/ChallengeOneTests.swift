//
//  ChallengeOneTests.swift
//  ChallengeOneTests
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

import XCTest
import ChallengeOne

final class ChallengeOneTests: XCTestCase {

    func test_init_ViewControllerShouldBeTableViewController() {
        let sut = makeSUT()
        XCTAssert(sut is UITableViewController, "ViewController should be a UITableViewController")
    }

    // MARK: - Helper methods

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> ViewController {
        let viewController = ViewController()
        trackForMemoryLeaks(viewController)
        return viewController
    }

}
