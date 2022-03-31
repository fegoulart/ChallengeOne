//
//  ChallengeOneTests.swift
//  ChallengeOneTests
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

import XCTest
import ChallengeOne

final class ChallengeOneTests: XCTestCase {

    // Uncomment one test at a time

    func test_init_viewControllerShouldBeTableViewController() {
        let (sut, _) = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssert(sut is UITableViewController, "ViewController should be a UITableViewController")
    }

    func test_init_viewControllerShouldCallViewModelGetDataOnce() {
        let (sut, viewModelMock) = makeSUT()
        sut.loadViewIfNeeded()
        XCTAssertEqual(
            viewModelMock.getDataCallsCount,
            1,
            """
            ViewController should call
  ViewModel getData method once, but it called \(viewModelMock.getDataCallsCount)
  time(s)
  """
        )
    }

    func test_init_ViewControllerShouldImplementViewModelDelegate() {
        let (sut, _) = makeSUT()
        XCTAssert(sut is ViewModelDelegate, "ViewController should implement ViewModelDelegate")
    }

    func test_dataReceived_tableShouldHaveCells() {
        let (sut, viewModelMock) = makeSUT()
        sut.loadViewIfNeeded()
        viewModelMock.getData()
        XCTAssert(
            sut.tableView.visibleCells.count > 0,
            "VisibleCells should be more than 0, but got \(sut.tableView.visibleCells.count)"
        )
    }

    // MARK: - Helper methods

    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (ViewController, ViewModelMock) {
        let viewModelSpy = ViewModelMock()
        let viewController = ViewController(viewModel: viewModelSpy)
        trackForMemoryLeaks(viewController)
        trackForMemoryLeaks(viewModelSpy)
        return (viewController, viewModelSpy)
    }

    private class ViewModelMock: ViewModelProtocol {
        weak var delegate: ViewModelDelegate?

        var getDataCallsCount = 0

        func getData() {
            getDataCallsCount += 1
            delegate?.dataReceived(["Turkish Angora", "York Chocolate", "Somali"])
        }
    }
}
