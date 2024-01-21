//
//  Panel.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

protocol Panel {
	func display() -> Glyph
}

struct StaticPanel: Panel {
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

struct ScrollingPanel: Panel {
	private let glyph: Glyph
	private var positionFromLeft: Int
	private let panelWidth: Int
	
	init(string: String, environment: Environment) {
		let glyph = environment.font.glyph(from: string, spaceBetweenCharacters: environment.spaceBetweenCharacters)
		self.init(glyph: glyph, positionFromLeft: environment.panelWidth, panelWidth: environment.panelWidth)
	}

	private init(glyph: Glyph, positionFromLeft: Int, panelWidth: Int) {
		self.glyph = glyph
		self.positionFromLeft = positionFromLeft
		self.panelWidth = panelWidth
	}

	mutating func scrollLeft() {
		let newPositionFromLeft = positionFromLeft + glyph.width <= 1 ? panelWidth : positionFromLeft - 1
		positionFromLeft = newPositionFromLeft
	}
	
	func display() -> Glyph {
		if positionFromLeft == panelWidth {
			return glyph.trimRight(glyph.width).padLeft(positionFromLeft)
		}

		let trimLeft = positionFromLeft < 0 ? abs(positionFromLeft) : 0
		let trimRight = glyph.width - (panelWidth - positionFromLeft)
		let padLeft = max(0, positionFromLeft)
		let padRight = positionFromLeft + glyph.width >= panelWidth ? 0 : panelWidth - (positionFromLeft + glyph.width)

		return glyph
			.trimLeft(trimLeft)
			.trimRight(trimRight)
			.padLeft(padLeft)
			.padRight(padRight)
	}
}
