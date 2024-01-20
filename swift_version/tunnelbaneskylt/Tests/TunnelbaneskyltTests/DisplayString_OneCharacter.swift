//
//  DisplayString_OneCharacter.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

final class DisplayString_OneCharacter: TestDisplayStringBase {
	
	func test_fontWithOneCharacter_size_3x3() throws {
		given_screen(
			withFont: [
				"x": "|#.#|.#.|#.#|"])
		
		when_display("x")
		
		then_shouldDisplay([
			"* *",
			" * ",
			"* *"
		])
	}
	
	func test_fontWithTwoCharacters_size_3x3_displayFirstCharacter() throws {
		given_screen(
			withFont: [
				"1": "|.##|.#.|.#.|",
				"2": "|#.#|#.#|#.#|"])
		
		when_display("1")
		
		then_shouldDisplay([
			" * ",
			" * ",
			" * "
		])
	}
	
	func test_fontWithTwoCharacters_size_3x3_displaySecondCharacter() throws {
		given_screen(
			withFont: [
				"1": "|.##|.#.|.#.|",
				"2": "|#.#|#.#|#.#|"])
		
		when_display("2")
		
		then_shouldDisplay([
			"* *",
			"* *",
			"* *"
		])
	}
}
