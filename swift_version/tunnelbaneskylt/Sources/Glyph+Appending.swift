//
//  Glyph+Appending.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

extension Glyph {
	func appending(glyph: Glyph, spaceBetween: Int) -> Glyph {
		let maxHeight = max(height, glyph.height)
		
		let left = self.expand(toHeight: maxHeight)
		let right = glyph.expand(toHeight: maxHeight)
		
		var lines = [String]()

		for row in 0..<maxHeight {
			let line = left.lines[row] + spaceBetween.spaces() + right.lines[row]
			lines.append(line)
		}
		
		return Glyph(lines: lines)
	}

	private func expand(toHeight height: Int) -> Glyph {
		if self.height >= height {
			return self
		}
		
		let maxWidth = lines.maxWidth()
		
		let numberOfExtraLines = height - lines.count
		
		var newGlyph = lines
		for _ in 0..<numberOfExtraLines {
			newGlyph.append(maxWidth.spaces())
		}
		
		return Glyph(lines: newGlyph)
	}
}

extension Int {
	func spaces() -> String {
		String(repeating: displayOff, count: self)
	}
}

