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
	var font: Font?
	var actual: [String]?
	
	override func setUp() async throws {
		font = nil
		actual = nil
	}

	func given_font(_ font: [String: String]) {
		self.font = Font(characters: font)
	}
	
	func when_display(_ s: String, spaceBetweenCharacters: Int = 2, file: StaticString = #file, line: UInt = #line) {
		guard let font else {
			XCTFail("No font is defined", file: file, line: line)
			return
		}

		let screen = Screen(font: font, spaceBetweenCharacters: spaceBetweenCharacters)
		actual = screen.displayString(s)
	}
	
	func then_shouldDisplay(_ expected: [String], file: StaticString = #file, line: UInt = #line) {
		guard let actual else {
			XCTFail("No actual result is available", file: file, line: line)
			return
		}

		XCTAssertEqual(actual, expected, file: file, line: line)
	}
}

