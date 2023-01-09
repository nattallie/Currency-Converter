//
//  Currency_ConverterTests.swift
//  Currency ConverterTests
//
//  Created by Nata Khurtsidze on 09.01.23.
//

import XCTest
import Currency_Converter

final class CurrencyTests: XCTestCase {
    typealias sut = Currency
    
    func testAllCases() {
        XCTAssert(sut.allCases.contains(.USD))
        XCTAssert(sut.allCases.contains(.EUR))
        XCTAssert(sut.allCases.contains(.JPY))
        XCTAssertEqual(sut.allCases.count, 3)
    }
    
    func testAllCasesRawValue() {
        XCTAssertEqual(sut.USD.rawValue, "USD")
        XCTAssertEqual(sut.EUR.rawValue, "EUR")
        XCTAssertEqual(sut.JPY.rawValue, "JPY")
    }
    
    func testAllCasesSymbol() {
        XCTAssertEqual(sut.USD.symbol, "$")
        XCTAssertEqual(sut.EUR.symbol, "€")
        XCTAssertEqual(sut.JPY.symbol, "¥")
    }
}
