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
	let environment: Environment
	
	func display() -> Glyph {
		if environment.panelWidth == 0 {
			return Glyph.null
		}
		
		let leftGlyph = environment.font.glyph(from: left, spaceBetweenCharacters: environment.spaceBetweenCharacters)
		let rightGlyph = environment.font.glyph(from: right, spaceBetweenCharacters: environment.spaceBetweenCharacters)
		
		if environment.panelWidth < leftGlyph.width {
			return leftGlyph.trimRight(leftGlyph.width - environment.panelWidth)
		}

		let glyphWidth = leftGlyph.width + rightGlyph.width

		if environment.panelWidth < glyphWidth {
			return [leftGlyph, rightGlyph.trimRight(glyphWidth - environment.panelWidth)].concatenate(spaceBetween: 0)
		}
		
		let spaceBetweenLeftAndRight = environment.panelWidth - glyphWidth

		return [leftGlyph, rightGlyph].concatenate(spaceBetween: spaceBetweenLeftAndRight)
	}
}
