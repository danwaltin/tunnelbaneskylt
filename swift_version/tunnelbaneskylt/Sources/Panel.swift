//
//  Panel.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

struct StaticPanel {
	let font: Font
	let width: Int
	let spaceBetweenCharacters: Int
	
	func display(left: String, right: String) -> Glyph {
		let leftGlyph = font.glyph(from: left, spaceBetweenCharacters: spaceBetweenCharacters)
		let rightGlyph = font.glyph(from: right, spaceBetweenCharacters: spaceBetweenCharacters)

		let glyphWidth = leftGlyph.width + rightGlyph.width
		let spaceBetweenLeftAndRight = width - glyphWidth
		
		if spaceBetweenLeftAndRight >= 0 {
			return [leftGlyph, rightGlyph].concatenate(spaceBetween: spaceBetweenLeftAndRight)
		}
		return Glyph.null
	}
}
