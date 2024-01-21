//
//  TestBase.swift
//  
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

import Foundation

import XCTest
@testable import tunnelbaneskylt

class TestBase: XCTestCase {
	var font: Font?
	var actual: Glyph?
	
	override func setUp() {
		font = nil
		actual = nil
	}
	
	func given_font(_ font: [String: String]) {
		self.font = Font(characters: font)
	}

	func then_shouldDisplay(_ expected: [String], file: StaticString = #file, line: UInt = #line) {
		guard let actual else {
			XCTFail("No actual result is available", file: file, line: line)
			return
		}

		XCTAssertEqual(actual.lines, expected, file: file, line: line)
	}
}
