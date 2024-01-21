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
		
		given_font([
			"1": "|#|.|",
			"2": "|..|##|"])
		given_panelWidth(6)
		given_spaceBetweenCharacters(1)
	}

	func test_beforeScrollStarted() {

		when_scrollLeft(string: "12", scrolledTimes: 0)
		
		then_shouldDisplay([
			"      ",
			"      "
		])
	}

	func test_scrollLeft_times_1() {
		when_scrollLeft(string: "12", scrolledTimes: 1)
		then_shouldDisplay([
			"     *",
			"      "
		])
	}
	
	func test_scrollLeft_times_2() {
		when_scrollLeft(string: "12", scrolledTimes: 2)
		then_shouldDisplay([
			"    * ",
			"      "
		])
	}

	func test_scrollLeft_times_3() {
		when_scrollLeft(string: "12", scrolledTimes: 3)
		then_shouldDisplay([
			"   *  ",
			"     *"
		])
	}

	func test_scrollLeft_times_4() {
		when_scrollLeft(string: "12", scrolledTimes: 4)
		then_shouldDisplay([
			"  *   ",
			"    **"
		])
	}

	func test_scrollLeft_times_5() {
		when_scrollLeft(string: "12", scrolledTimes: 5)
		then_shouldDisplay([
			" *    ",
			"   ** "
		])
	}

	func test_scrollLeft_times_6() {
		when_scrollLeft(string: "12", scrolledTimes: 6)
		then_shouldDisplay([
			"*     ",
			"  **  "
		])
	}

	func test_scrollLeft_times_7() {
		when_scrollLeft(string: "12", scrolledTimes: 7)
		then_shouldDisplay([
			"      ",
			" **   "
		])
	}

	func test_scrollLeft_times_8() {
		when_scrollLeft(string: "12", scrolledTimes: 8)
		then_shouldDisplay([
			"      ",
			"**    "
		])
	}

	func test_scrollLeft_times_9() {
		when_scrollLeft(string: "12", scrolledTimes: 9)
		then_shouldDisplay([
			"      ",
			"*     "
		])
	}

	func test_scrollLeft_times_10() {
		when_scrollLeft(string: "12", scrolledTimes: 10)
		then_shouldDisplay([
			"      ",
			"      "
		])
	}

	func test_scrollLeft_times_11() {
		// now we have wrapped around
		when_scrollLeft(string: "12", scrolledTimes: 11)
		then_shouldDisplay([
			"     *",
			"      "
		])
	}

	func test_scrollLeft_times_12() {
		// now we have wrapped around
		when_scrollLeft(string: "12", scrolledTimes: 12)
		then_shouldDisplay([
			"    * ",
			"      "
		])
	}

	func test_scrollLeft_times_13() {
		// now we have wrapped around
		when_scrollLeft(string: "12", scrolledTimes: 13)
		then_shouldDisplay([
			"   *  ",
			"     *"
		])
	}

	func test_scrollLeft_times_14() {
		// now we have wrapped around
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
