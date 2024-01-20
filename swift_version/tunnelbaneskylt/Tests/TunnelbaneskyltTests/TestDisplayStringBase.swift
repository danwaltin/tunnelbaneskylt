//
//  TestDisplayStringBase.swift
//  
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

import XCTest
@testable import tunnelbaneskylt

class TestDisplayStringBase: XCTestCase {
	var screen: Screen?
	var actual: [String]?
	
	override func setUp() async throws {
		screen = nil
		actual = nil
	}

	func given_screen(spaceBetweenCharacters: Int = 2, withFont font: [String: String]) {
		let font = Font(characters: font)
		screen = Screen(font: font, spaceBetweenCharacters: spaceBetweenCharacters)
	}
	
	func when_display(_ s: String, file: StaticString = #file, line: UInt = #line) {
		guard let screen else {
			XCTFail("No screen is defined", file: file, line: line)
			return
		}

		actual = screen.displayString(s)
	}
	
	func then_shouldDisplay(_ expected: [String], file: StaticString = #file, line: UInt = #line) {
		guard let actual else {
			XCTFail("No screen is defined", file: file, line: line)
			return
		}

		XCTAssertEqual(actual, expected, file: file, line: line)
	}
}

