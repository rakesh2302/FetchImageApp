//
//  FetchImageTests.swift
//  FetchImageTests
//
//  Created by Rakesh Shetty on 11/14/22.
//

import XCTest
@testable import FetchImage
import Combine

class FetchImageTests: XCTestCase {

    var viewModel: FetchImageViewModel?
    private var cancellable = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = FetchImageViewModel(imageAction: ImageActionImplementation())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        cancellable.removeAll()
    }

    func testImages() throws {
        viewModel?.getImages()
        let expectation = expectation(description: "Load Images")

        viewModel?.$state
            .sink { state in
                guard case let .loaded(imageInfos) = state,
                imageInfos.count > 0 else {
                    return
                }
                
                expectation.fulfill()
            }
            .store(in: &cancellable)

        waitForExpectations(timeout: 5.0)

        XCTAssertEqual(viewModel?.imageInfos.isEmpty, false)
    }
}
