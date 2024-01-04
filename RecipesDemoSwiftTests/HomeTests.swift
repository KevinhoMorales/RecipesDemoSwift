//
//  HomeTests.swift
//  RecipesDemoSwiftTests
//
//  Created by Kevinho Morales on 3/1/24.
//

import XCTest
@testable import RecipesDemoSwift

final class HomeTests: XCTestCase {

    var sut: HomeViewModelProtocol!
    
    override func setUpWithError() throws {
        let homeView = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
        sut = HomeViewModel(view: homeView)
    }

    override func tearDownWithError() throws {

    }

    func testExample() throws {

    }
    
    func testRecipesRequest() {
        sut.retrieveRecipes() { recipes in
            XCTAssertTrue(recipes.count == 3)
        }
    }

    func testTitle() {
        XCTAssertTrue(sut.getTitle() == "Recipes")
    }
}
