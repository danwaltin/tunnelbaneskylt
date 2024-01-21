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
		let heights = glyphs.map {$0.height}
		let maxHeight = heights.max() ?? 0
		
		let heightAdjustedGlyphs = glyphs.map {$0.expand(toHeight: maxHeight)}

		return concatenate(glyphs: heightAdjustedGlyphs)
	}
	
	private func concatenate(glyphs: [Glyph]) -> [String] {
		let heights = Set(glyphs.map({$0.height}))
		assert(heights.count <= 1)

		guard let first = glyphs.first else {
			return []
		}
		
		let height = first.height
		
		var lines = [String]()
		
		for i in 0..<height {
			let glyphRowsAtIndex = glyphs.map{$0.lines[i]}
			
			let line = glyphRowsAtIndex.joined(separator: String(repeating: " ", count: spaceBetweenCharacters))
			lines.append(line)
		}
		return lines
	}
}
