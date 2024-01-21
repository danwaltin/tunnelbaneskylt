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
		
		let glyphs = s.map {font.glyph(from: $0)}
		
		return concatenate(glyphs: glyphs)
	}
	
	private func concatenate(glyphs: [Glyph]) -> [String] {
		guard let first = glyphs.first else {
			return []
		}

		var totalGlyph = first
		for i in 1..<glyphs.count {
			totalGlyph = totalGlyph.appending(glyph: glyphs[i], spaceBetween: spaceBetweenCharacters)
		}
		return totalGlyph.lines
	}
}
