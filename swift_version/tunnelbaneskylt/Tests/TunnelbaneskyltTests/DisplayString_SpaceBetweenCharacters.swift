//
//  DisplayString_SpaceBetweenCharacters.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

final class DisplayString_SpaceBetweenCharacters: TestDisplayStringBase {
	
	// MARK: - Display one character
	func test_displayOneCharacter_spaceBetween_0() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("2", spaceBetweenCharacters: 0)
		
		then_shouldDisplay([
			"* *",
			"* *",
			"* *"
		])
	}
	
	func test_displayOneCharacter_spaceBetween_2() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("2", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"* *",
			"* *",
			"* *"
		])
	}
	
	// MARK: - Display two characters
	
	func test_displayTwoCharacters_12_spaceBetween_0() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("12", spaceBetweenCharacters: 0)
		
		then_shouldDisplay([
			" * * *",
			" * * *",
			" * * *"
		])
	}
	
	func test_displayTwoCharacters_21_spaceBetween_0() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("21", spaceBetweenCharacters: 0)
		
		then_shouldDisplay([
			"* * * ",
			"* * * ",
			"* * * "
		])
	}
	
	func test_displayTwoCharacters_12_spaceBetween_1() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("12", spaceBetweenCharacters: 1)
		
		then_shouldDisplay([
			" *  * *",
			" *  * *",
			" *  * *"
		])
	}
	
	func test_displayTwoCharacters_21_spaceBetween_1() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("21", spaceBetweenCharacters: 1)
		
		then_shouldDisplay([
			"* *  * ",
			"* *  * ",
			"* *  * "
		])
	}
	
	func test_displayTwoCharacters_spaceBetween_2() throws {
		given_font([
			"1": "|.#.|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("xx", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			" *   * *",
			" *   * *",
			" *   * *"
		])
	}
	
	// MARK: - Display three characters
	func test_displayThreeCharacters_123_spaceBetween_2() throws {
		given_font([
			"1": "|.##|.#.|.#.|",
			"2": "|#.#|#.#|#.#|",
			"3": "|###|###|###|"])
		
		when_display("123", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			" *   * *  ***",
			" *   * *  ***",
			" *   * *  ***"
		])
	}
	
	func test_displayThreeCharacters_321_spaceBetween_3() throws {
		given_font([
			"1": "|.##|.#.|.#.|",
			"2": "|#.#|#.#|#.#|",
			"3": "|###|###|###|"])
		
		when_display("321", spaceBetweenCharacters: 3)
		
		then_shouldDisplay([
			"***   * *    * ",
			"***   * *    * ",
			"***   * *    * "
		])
	}
}
