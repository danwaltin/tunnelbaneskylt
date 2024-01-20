//
//  DisplayString_EmptyString.swift
//  
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

final class DisplayString_EmptyString: TestDisplayStringBase {
	
	func test_equalHeights_displayEmptyString() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("")
		
		then_shouldDisplay([
			"",
			"",
			""
		])
	}
	
	func test_firstHigher_displayEmptyString() throws {
		given_font([
			"1": "|.#.|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("")
		
		then_shouldDisplay([
			"",
			"",
			"",
			""
		])
	}
	
	func test_secondHigher_displayEmptyString() throws {
		given_font([
			"1": "|.#.|",
			"2": "|#.#|#.#|"])
		
		when_display("")
		
		then_shouldDisplay([
			"",
			""
		])
	}
}
