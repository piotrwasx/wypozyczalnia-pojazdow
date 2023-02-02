//
//  wypozyczalnia_pojazdowTests.swift
//  wypozyczalnia-pojazdowTests
//
//  Created by Piotr Waś on 25/01/2023.
//

import XCTest
@testable import wypozyczalnia_pojazdow

final class wypozyczalnia_pojazdowTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCarDataValidation() throws {
        let car = Car(car_brand: "Opel", car_model: "Astra", car_year: -2010, car_mileage_km: -1040, car_transmission: "Manual", car_motor: "Petrol", car_body_type: "Hatchback", car_rent_price_pln: -100)
        let car2 = Car(car_brand: "", car_model: "", car_year: 2010, car_mileage_km: 1040, car_transmission: "", car_motor: "", car_body_type: "", car_rent_price_pln: 100)
        
        XCTAssertEqual(car.isCarDataValid(), false, "function passes negative values")
        XCTAssertEqual(car2.isCarDataValid(), false, "function passes empty strings")
    }
    
    func testMotorcycleDataValidation() throws {
        let motorcycle = Motorcycle(motorcycle_model: "Speed100", motorcycle_brand: "Ducati", motorcycle_year: -1000, motorcycle_mileage_km: -100, motorcycle_motor: "Petrol", motorcycle_body_type: "Ścigacz", motorcycle_rent_price_pln: -100)
        let motorcycle2 = Motorcycle(motorcycle_model: "", motorcycle_brand: "", motorcycle_year: 10, motorcycle_mileage_km: 10, motorcycle_motor: "", motorcycle_body_type: "", motorcycle_rent_price_pln: 10)
        
        XCTAssertEqual(motorcycle.isMotorcycleDataValid(), false, "function passes negative values")
        XCTAssertEqual(motorcycle2.isMotorcycleDataValid(), false, "function passes empty strings")
    }
    
    func testUtilityDataValidation() throws {
        let utility = Utility(utility_brand: "Brand", utility_model: "Model", utility_year: -1000, utility_mileage_km: -10, utility_transmission: "Manual", utility_motor: "Diesel", utility_type: "Truck", utility_rent_price_pln: -10)
        let utility2 = Utility(utility_brand: "", utility_model: "", utility_year: 1000, utility_mileage_km: 10, utility_transmission: "", utility_motor: "", utility_type: "", utility_rent_price_pln: 10)
        
        XCTAssertEqual(utility.isUtilityDataValid(), false, "function passes negative values")
        XCTAssertEqual(utility2.isUtilityDataValid(), false, "function passes empty strings")
    }
    
//    func testCliendDataValidation() throws {
//        let client = Client()
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
