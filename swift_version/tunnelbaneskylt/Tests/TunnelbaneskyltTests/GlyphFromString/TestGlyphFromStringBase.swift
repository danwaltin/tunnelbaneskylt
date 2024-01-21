//
//  TestGlyphFromStringBase.swift
//  
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

import XCTest
@testable import tunnelbaneskylt

class TestGlyphFromStringBase: TestBase {
	func when_display(_ s: String, spaceBetweenCharacters: Int = 2, file: StaticString = #file, line: UInt = #line) {
		guard let font else {
			XCTFail("No font is defined", file: file, line: line)
			return
		}

		actual = font.glyph(from: s, spaceBetweenCharacters: spaceBetweenCharacters)
	}
}

