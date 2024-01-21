//
//  Screen.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

struct Screen {
	let font: Font
	let spaceBetweenCharacters: Int
}

extension Screen {
	func displayString(_ s: String) -> [String] {
		return displayGlyph(from: s)
	}
	
	private func displayGlyph(from character: String) -> [String] {
		guard let characterDefinition = font.characters[character] else {
			return []
		}

		let characterLines = characterDefinition.expandingZeroWidths().split(separator: "|")
		let widths = characterLines.map{$0.count}
		
		let maxLength = widths.max() ?? 0
		
		let glyph = characterLines.map { String($0
			.replacing("#", with: "*")
			.replacing(".", with: " ")
			.padding(toLength: maxLength, withPad: " ", startingAt: 0)) }
		
		return glyph
	}
	
}

fileprivate extension String {
	func expandingZeroWidths() -> String {
		var s = self
		while s.contains("||") {
			s = s.replacing("||", with: "| |")
		}
		
		return s
	}

}
