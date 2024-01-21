//
//  Font.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

let fontOn = "#"
let fontOff = "."
let fontSeparator = "|"
let fontDoubleSeparator = fontSeparator + fontSeparator

struct Font: Decodable {
	let characters: [String:String]
}

extension Font {
	func glyph(from s: String, spaceBetweenCharacters: Int) -> Glyph {
		
		let glyphs = s.map {self.glyph(from: $0)}
		
		return glyphs.concatenate(spaceBetween: spaceBetweenCharacters)
	}

	func glyph(from character: Character) -> Glyph {
		guard let characterDefinition = characters[String(character)] else {
			return Glyph.null
		}

		let characterLines = characterDefinition.expandingZeroWidths().split(separator: fontSeparator)
		
		let glyphLines = characterLines.map { String($0
			.replacing(fontOn, with: displayOn)
			.replacing(fontOff, with: displayOff)) }
		
		return Glyph(lines: glyphLines)
	}
}

fileprivate extension String {
	func expandingZeroWidths() -> String {
		var s = self
		while s.contains(fontDoubleSeparator) {
			s = s.replacing(fontDoubleSeparator, with: "\(fontSeparator)\(fontOff)\(fontSeparator)")
		}
		
		return s
	}
}
