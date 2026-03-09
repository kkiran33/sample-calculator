//
//  CalculatorBrainTests.swift
//  CalculatorTests
//

import XCTest
@testable import Calculator

class CalculatorBrainTests: XCTestCase {

    var brain: CalculatorBrain!

    override func setUp() {
        super.setUp()
        brain = CalculatorBrain()
    }

    // MARK: - x² Tests

    func testSquare_positiveNumber() {
        brain.setOperand(4)
        brain.performOperation("x²")
        XCTAssertEqual(brain.result, 16)
    }

    func testSquare_negativeNumber() {
        brain.setOperand(-3)
        brain.performOperation("x²")
        XCTAssertEqual(brain.result, 9)
    }

    func testSquare_zero() {
        brain.setOperand(0)
        brain.performOperation("x²")
        XCTAssertEqual(brain.result, 0)
    }

    func testSquare_decimal() {
        brain.setOperand(2.5)
        brain.performOperation("x²")
        XCTAssertEqual(brain.result, 6.25)
    }

    // MARK: - n! Tests

    func testFactorial_zero() {
        brain.setOperand(0)
        brain.performOperation("n!")
        XCTAssertEqual(brain.result, 1) // 0! = 1 by definition
    }

    func testFactorial_one() {
        brain.setOperand(1)
        brain.performOperation("n!")
        XCTAssertEqual(brain.result, 1)
    }

    func testFactorial_five() {
        brain.setOperand(5)
        brain.performOperation("n!")
        XCTAssertEqual(brain.result, 120)
    }

    func testFactorial_ten() {
        brain.setOperand(10)
        brain.performOperation("n!")
        XCTAssertEqual(brain.result, 3628800)
    }

    func testFactorial_twenty() {
        brain.setOperand(20)
        brain.performOperation("n!")
        XCTAssertEqual(brain.result, 2432902008176640000)
    }

    func testFactorial_negativeNumber_returnsNaN() {
        brain.setOperand(-1)
        brain.performOperation("n!")
        XCTAssertTrue(brain.result!.isNaN)
    }

    func testFactorial_decimal_returnsNaN() {
        brain.setOperand(3.5)
        brain.performOperation("n!")
        XCTAssertTrue(brain.result!.isNaN)
    }

    func testFactorial_greaterThan20_returnsNaN() {
        brain.setOperand(21)
        brain.performOperation("n!")
        XCTAssertTrue(brain.result!.isNaN)
    }
}
