//
//  DisplayString_DifferentWidthsAndHeights.swift
//  
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

final class DisplayString_DifferentWidthsAndHeights: TestDisplayStringBase {
	// MARK: - One character, different widths
	func test_displayOneCharacter_threeLines_firstLineWidest() throws {
		given_font([
			"x": "|#...|.#|..#|"])
		
		when_display("x")
		
		then_shouldDisplay([
			"*   ",
			" *  ",
			"  * "
		])
	}

	func test_displayOneCharacter_threeLines_secondLineWidest() throws {
		given_font([
			"x": "|#|.#..|..#|"])
		
		when_display("x")
		
		then_shouldDisplay([
			"*   ",
			" *  ",
			"  * "
		])
	}

	func test_displayOneCharacter_fourLines_fourthLineWidest() throws {
		given_font([
			"x": "|#|.#..|..#|...#.|"])
		
		when_display("x")
		
		then_shouldDisplay([
			"*    ",
			" *   ",
			"  *  ",
			"   * "
		])
	}

	func test_displayOneCharacter_threeLines_firstLineZeroWidth() throws {
		given_font([
			"x": "||.#..|..#|"])
		
		when_display("x")
		
		then_shouldDisplay([
			"    ",
			" *  ",
			"  * "
		])
	}

	// MARK: - Two characters, different widths
	func test_displayTwoCharacters_differentWidths() throws {
		given_font([
			"1": "|#|.#.|",
			"2": "|####|.##.|"])
		
		when_display("x", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"*   ****",
			" *   **"
		])
	}

	// MARK: - Three characters, different heights
	func test_displayThreeCharacters_firstHighest() throws {
		given_font([
			"1": "|###|###|###|",
			"2": "|###|.#.|",
			"3": "|###|#.#|"])
		
		when_display("123", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"***  ***  ***",
			"***   *   * *",
			"***          "
		])
	}

	func test_displayThreeCharacters_secondHighest() throws {
		given_font([
			"1": "|###|.#.|",
			"2": "|###|###|###|",
			"3": "|###|#.#|"])
		
		when_display("123", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"***  ***  ***",
			" *   ***  * *",
			"     ***     "
		])
	}

	func test_displayThreeCharacters_thirdHighest() throws {
		given_font([
			"1": "|###|.#.|",
			"2": "|###|#.#|",
			"3": "|###|###|###|"])
		
		when_display("123", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"***  ***  ***",
			" *   * *  ***",
			"          ***"
		])
	}
}
