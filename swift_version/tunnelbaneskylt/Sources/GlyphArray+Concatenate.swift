//
//  GlyphArray+Concatenate.swift
//  
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

extension Array where Element == Glyph {
	func concatenate(spaceBetween: Int) -> Glyph {
		guard let first = self.first else {
			return Glyph.null
		}

		var totalGlyph = first
		for i in 1..<self.count {
			totalGlyph = totalGlyph.appending(glyph: self[i], spaceBetween: spaceBetween)
		}
		return totalGlyph
	}
}
