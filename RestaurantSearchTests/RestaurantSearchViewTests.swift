//
//  RestaurantSearchViewTests.swift
//  RestaurantSearchTests
//  
//  Created by Terumu Watanabe on 2024/01/06
//  
//

import XCTest

final class RestaurantSearchViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchButtonTapped() throws {
        let vm = RestaurantSearchViewModel()

        XCTAssertEqual(vm.isWarningVisible, false)
        vm.keyword = "ラーメン"
        vm.searchButtonTapped()

        XCTAssertEqual(vm.isWarningVisible, false)
    }

    func testSearchButtonTapped_empty() throws {
        let vm = RestaurantSearchViewModel()

        XCTAssertEqual(vm.isWarningVisible, false)
        vm.searchButtonTapped()

        XCTAssertEqual(vm.isWarningVisible, true)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
