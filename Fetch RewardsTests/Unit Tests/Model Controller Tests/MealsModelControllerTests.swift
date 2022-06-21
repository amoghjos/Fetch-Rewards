//
//  MealsModelControllerTests.swift
//  Fetch RewardsTests
//
//  Created by Amogh Joshi on 6/20/22.
//

import XCTest
@testable import Fetch_Rewards

class MealsModelControllerTests: XCTestCase {
    var sut: MealsModelController!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func compareExpectedToActualMeals(_ expected: [Meal],_ actual: [Meal]) {
        XCTAssertEqual(expected.count, actual.count)
        
        //if the number elements are equal, then are they sorted alphabetically?
        for i in 0..<expected.count {
            let expectedMeal = expected[i]
            let actualMeal = actual[i]
            XCTAssertEqual(expectedMeal.name, actualMeal.name)
            XCTAssertEqual(expectedMeal.image, actualMeal.image)
            XCTAssertEqual(expectedMeal.id, actualMeal.id)
    }
    
    func test_getMeals_for_dessert_category_alphabetically_sorted() {
        //arrange
        let inputMeals = [Meal(name: "Tortoise", image: UIImage(systemName: "tortoise")!, id: 01),
                          Meal(name: "Hare", image: UIImage(systemName: "hare")!, id: 02),
                          Meal(name: "Ant", image: UIImage(systemName: "ant")!, id: 03),
                          Meal(name: "Bug", image: UIImage(systemName: "ladybug")!, id: 04)
                  ]
        let mealsStorageMock = MealsStorageMock(inputMeals)
        sut = MealsModelController(using: mealsStorageMock)
        
        let expectedMeals = [Meal(name: "Ant", image: UIImage(systemName: "ant")!, id: 03),
                             Meal(name: "Bug", image: UIImage(systemName: "ladybug")!, id: 04),
                             Meal(name: "Hare", image: UIImage(systemName: "hare")!, id: 02),
                             Meal(name: "Tortoise", image: UIImage(systemName: "tortoise")!, id: 01)
                     ]
        
        //act
        let actualMeals = sut.getMeals(for: .dessert)
        
        //assert
        compareExpectedToActualMeals(expectedMeals, actualMeals)
        }
    }
    
    func test_getMeals_for_dessert_category_remove_empty_names() {
        //arrange
        let inputMeals = [Meal(name: "", image: UIImage(systemName: "tortoise")!, id: 01),
                          Meal(name: "", image: UIImage(systemName: "hare")!, id: 02),
                          Meal(name: "Ant", image: UIImage(systemName: "ant")!, id: 03),
                          Meal(name: "Bug", image: UIImage(systemName: "ladybug")!, id: 04)
                  ]
        let mealsStorageMock = MealsStorageMock(inputMeals)
        sut = MealsModelController(using: mealsStorageMock)
        
        let expectedMeals = [Meal(name: "Ant", image: UIImage(systemName: "ant")!, id: 03),
                             Meal(name: "Bug", image: UIImage(systemName: "ladybug")!, id: 04)
                     ]
        
        //act
        let actualMeals = sut.getMeals(for: .dessert)
        
        //assert
        compareExpectedToActualMeals(expectedMeals, actualMeals)
    }
}

fileprivate class MealsStorageMock: MealsStorage {
    
    private let meals: [Meal]
    
    init(_ meals: [Meal]){
        self.meals = meals
    }
    
    func getMeals(for category: MealCategory) -> [Meal] {
        switch category {
        case .dessert:
            return meals
        }
    }
}
