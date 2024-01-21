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
		
		let glyphs = s.map {font.displayGlyph(from: $0)}
		let heights = glyphs.map {$0.count}
		let maxHeight = heights.max() ?? 0
		
		let heightAdjustedGlyphs = glyphs.map {expand(glyph: $0, toHeight: maxHeight)}

		return concatenate(glyphs: heightAdjustedGlyphs)
		guard let first = s.first else {
			return []
		}
		
		return font.displayGlyph(from: first)
	}
	
	private func concatenate(glyphs: [[String]]) -> [String] {
		let heights = Set(glyphs.map({$0.count}))
		assert(heights.count <= 1)

		guard let first = glyphs.first else {
			return []
		}
		
		let height = first.count
		
		var lines = [String]()
		
		for i in 0..<height {
			let glyphRowsAtIndex = glyphs.map{$0[i]}
			
			let line = glyphRowsAtIndex.joined(separator: String(repeating: " ", count: spaceBetweenCharacters))
			lines.append(line)
		}
		return lines
	}
	
	private func expand(glyph: [String], toHeight height: Int) -> [String] {
		if glyph.count >= height {
			return glyph
		}
		
		let widths = glyph.map {$0.count}
		let maxWidth = widths.max() ?? 0
		
		let numberOfExtraLines = height - glyph.count
		
		var newGlyph = glyph
		for _ in 0..<numberOfExtraLines {
			newGlyph.append(String(repeating: " ", count: maxWidth))
		}
		return newGlyph
	}
}
