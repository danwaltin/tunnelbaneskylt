//
//  DisplayScrollingPanel.swift
//  
//
//  Created by Dan Waltin on 2024-01-21.
//


import Foundation
import XCTest
@testable import tunnelbaneskylt

final class DisplayScrollingPanel: TestPanelsBase {
	var spaceBetweenCharacters: Int?

	override func setUp() {
		super.setUp()
		
		spaceBetweenCharacters = nil
	}

	func test_beforeScrollStarted() {
		given_font([
			"1": "|#|.|",
			"2": "|..|##|"])
		given_panelWidth(6)
		given_spaceBetweenCharacters(1)

		when_scrollLeft(string: "12", scrolledTimes: 0)
		
		then_shouldDisplay([
			"      ",
			"      "
		])
	}

	func test_scrollLeft() {
		given_font([
			"1": "|#|.|",
			"2": "|..|##|"])
		given_panelWidth(6)
		given_spaceBetweenCharacters(1)
		
		when_scrollLeft(string: "12", scrolledTimes: 1)
		then_shouldDisplay([
			"     *",
			"      "
		])

		when_scrollLeft(string: "12", scrolledTimes: 2)
		then_shouldDisplay([
			"    * ",
			"      "
		])

		when_scrollLeft(string: "12", scrolledTimes: 3)
		then_shouldDisplay([
			"   *  ",
			"     *"
		])

		when_scrollLeft(string: "12", scrolledTimes: 4)
		then_shouldDisplay([
			"  *   ",
			"    **"
		])

		when_scrollLeft(string: "12", scrolledTimes: 5)
		then_shouldDisplay([
			" *    ",
			"   ** "
		])

		when_scrollLeft(string: "12", scrolledTimes: 6)
		then_shouldDisplay([
			"*     ",
			"  **  "
		])

		when_scrollLeft(string: "12", scrolledTimes: 7)
		then_shouldDisplay([
			"      ",
			" **   "
		])

		when_scrollLeft(string: "12", scrolledTimes: 8)
		then_shouldDisplay([
			"      ",
			"**    "
		])

		when_scrollLeft(string: "12", scrolledTimes: 9)
		then_shouldDisplay([
			"      ",
			"*     "
		])

		when_scrollLeft(string: "12", scrolledTimes: 10)
		then_shouldDisplay([
			"      ",
			"      "
		])

		// now we have wrapped around
		when_scrollLeft(string: "12", scrolledTimes: 11)
		then_shouldDisplay([
			"     *",
			"      "
		])

		when_scrollLeft(string: "12", scrolledTimes: 12)
		then_shouldDisplay([
			"    * ",
			"      "
		])

		when_scrollLeft(string: "12", scrolledTimes: 13)
		then_shouldDisplay([
			"   *  ",
			"     *"
		])

		when_scrollLeft(string: "12", scrolledTimes: 14)
		then_shouldDisplay([
			"  *   ",
			"    **"
		])
	}


	// MARK: -
	func given_spaceBetweenCharacters(_ value: Int) {
		spaceBetweenCharacters = value
	}

	func when_scrollLeft(string: String, scrolledTimes: Int, file: StaticString = #file, line: UInt = #line) {
		guard let font else {
			XCTFail("No font is defined", file: file, line: line)
			return
		}

		guard let panelWidth else {
			XCTFail("No panelWidth is defined", file: file, line: line)
			return
		}

		guard let spaceBetweenCharacters else {
			XCTFail("No spaceBetweenCharacters is defined", file: file, line: line)
			return
		}

		let environment = Environment(font: font, panelWidth: panelWidth, spaceBetweenCharacters: spaceBetweenCharacters)
		var panel = ScrollingPanel(string: string, environment: environment)

		for _ in 0..<scrolledTimes {
			panel = panel.scrollLeft()
		}
		
		actual = panel.display()
	}
}
