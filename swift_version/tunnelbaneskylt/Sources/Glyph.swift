//
//  Glyph.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

struct Glyph {
	static var null: Glyph {.init(lines: [])}
	
	let lines: [String]
	
	var height: Int {lines.count}
	
	func expand(toHeight height: Int) -> Glyph {
		if self.height >= height {
			return self
		}
		
		let widths = lines.map {$0.count}
		let maxWidth = widths.max() ?? 0
		
		let numberOfExtraLines = height - lines.count
		
		var newGlyph = lines
		for _ in 0..<numberOfExtraLines {
			newGlyph.append(String(repeating: " ", count: maxWidth))
		}
		
		return Glyph(lines: newGlyph)
	}
	
}
