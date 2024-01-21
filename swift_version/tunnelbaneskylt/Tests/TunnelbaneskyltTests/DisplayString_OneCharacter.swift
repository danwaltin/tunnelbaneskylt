//
//  DisplayString_OneCharacter.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

final class DisplayString_OneCharacter: TestDisplayStringBase {
	
	func test_periodAsSpace() throws {
		given_font([
			"x": "|#.#|.#.|#.#|"])
		
		when_display("x")
		
		then_shouldDisplay([
			"* *",
			" * ",
			"* *"
		])
	}

	func test_spaceAsSpace() throws {
		given_font([
			"x": "|# #| # |# #|"])
		
		when_display("x")
		
		then_shouldDisplay([
			"* *",
			" * ",
			"* *"
		])
	}

	func test_fontWithTwoCharacters_displayFirstCharacter() throws {
		given_font([
			"1": "|.##|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("1")
		
		then_shouldDisplay([
			" * ",
			" * ",
			" * "
		])
	}
	
	func test_fontWithTwoCharacters_displaySecondCharacter() throws {
		given_font([
			"1": "|.##|.#.|.#.|",
			"2": "|#.#|#.#|#.#|"])
		
		when_display("2")
		
		then_shouldDisplay([
			"* *",
			"* *",
			"* *"
		])
	}
	
	func test_oneLineOfSpaces() throws {
		given_font([
			"1": "   "])
		
		when_display("1")
		
		then_shouldDisplay([
			"   ",
		])
	}
	
	func test_oneLineOfPeriods() throws {
		given_font([
			"1": "..."])
		
		when_display("1")
		
		then_shouldDisplay([
			"   ",
		])
	}
	
	func test_noStartSeparator() throws {
		given_font([
			"1": "xxx|.x.|xxx|"])
		
		when_display("1")
		
		then_shouldDisplay([
			"***",
			" * ",
			"***",
		])
	}
	
	func test_noEndSeparator() throws {
		given_font([
			"1": "|xxx|.x.|xxx"])
		
		when_display("1")
		
		then_shouldDisplay([
			"***",
			" * ",
			"***",
		])
	}
}
