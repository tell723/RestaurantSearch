//
//  RestaurantSearchTests.swift
//  RestaurantSearchTests
//  
//  Created by Terumu Watanabe on 2023/10/02
//  
//

import XCTest
@testable import RestaurantSearch

final class RestaurantSearchTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() async throws {
        let vm = RestaurantSearchResultViewModel(searchKeyword: "")
        await vm.setUp(restaurantRepository: MockedRestaurantRepository())

        XCTAssertEqual(vm.isFetchingData, false)
        XCTAssertEqual(vm.searchedRestaurants.isEmpty, false)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
