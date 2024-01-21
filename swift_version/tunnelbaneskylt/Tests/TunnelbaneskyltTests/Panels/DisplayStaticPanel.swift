//
//  DisplayStaticPanel.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation
import XCTest
@testable import tunnelbaneskylt

final class DisplayStaticPanel: TestPanelsBase {

	// MARK: - Empty strings
	func test_leftIsEmptyString() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(10)
		
		when_display(left: "", right: "13", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"    *     ",
			"          ",
			"       ***"
		])
	}

	func test_rightIsEmptyString() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(10)
		
		when_display(left: "12", right: "", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"*         ",
			"   **     ",
			"          "
		])
	}

	func test_leftAndRightAreEmptyStrings() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(10)
		
		when_display(left: "", right: "", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([])
	}

	// MARK: - Zero width
	func test_zeroWidth() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(0)
		
		when_display(left: "12", right: "3", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([])
	}

	// MARK: - Width equal to glyphs width
	func test_widthEqualToSumOfLeftAndRightWidths() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(8)
		
		when_display(left: "12", right: "3", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"*       ",
			"   **   ",
			"     ***"
		])
	}

	// MARK: Width greater than glyphs width
	func test_widthOneGreaterThanSumOfLeftAndRightWidths() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(9)
		
		when_display(left: "12", right: "3", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"*        ",
			"   **    ",
			"      ***"
		])
	}

	func test_widthTenGreaterThanSumOfLeftAndRightWidths() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(17)
		
		when_display(left: "12", right: "3", spaceBetweenCharacters: 1)
		
		then_shouldDisplay([
			"*                ",
			"  **             ",
			"              ***"
		])
	}

	// MARK: - Width less than glyphs width
	func test_widthOneLessThanSumOfLeftAndRightWidths() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(7)
		
		when_display(left: "12", right: "3", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"*      ",
			"   **  ",
			"     **"
		])
	}

	func test_widthOneLessThanLeftWidth() {
		given_font([
			"1": "|#|.|.|",
			"2": "|..|##|..|",
			"3": "|...|...|###|"])
		given_panelWidth(4)
		
		when_display(left: "12", right: "3", spaceBetweenCharacters: 2)
		
		then_shouldDisplay([
			"*   ",
			"   *",
			"    "
		])
	}

	// MARK: -	
	func when_display(left: String, right: String, spaceBetweenCharacters: Int, file: StaticString = #file, line: UInt = #line) {
		guard let font else {
			XCTFail("No font is defined", file: file, line: line)
			return
		}

		guard let panelWidth else {
			XCTFail("No font is defined", file: file, line: line)
			return
		}
		
		let environment = Environment(font: font, panelWidth: panelWidth, spaceBetweenCharacters: spaceBetweenCharacters)
		let panel = StaticPanel(left: left, right: right, environment: environment)
		
		actual = panel.display()
	}
}
