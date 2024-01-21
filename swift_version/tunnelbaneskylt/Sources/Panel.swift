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
		Glyph.null
	}
}
