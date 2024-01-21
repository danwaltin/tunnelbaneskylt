//
//  Panel.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

struct StaticPanel {
	let left: String
	let right: String
	let font: Font
	let width: Int
	let spaceBetweenCharacters: Int
	
	func display() -> Glyph {
		if width == 0 {
			return Glyph.null
		}
		
		let leftGlyph = font.glyph(from: left, spaceBetweenCharacters: spaceBetweenCharacters)
		let rightGlyph = font.glyph(from: right, spaceBetweenCharacters: spaceBetweenCharacters)
		
		if width < leftGlyph.width {
			return leftGlyph.trimRight(leftGlyph.width - width)
		}

		let glyphWidth = leftGlyph.width + rightGlyph.width

		if width < glyphWidth {
			return [leftGlyph, rightGlyph.trimRight(glyphWidth - width)].concatenate(spaceBetween: 0)
		}
		
		let spaceBetweenLeftAndRight = width - glyphWidth

		return [leftGlyph, rightGlyph].concatenate(spaceBetween: spaceBetweenLeftAndRight)
	}
}
