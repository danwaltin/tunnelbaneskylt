//
//  Glyph.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

let displayOff = " "
let displayOn = "*"

struct Glyph {
	static var null: Glyph {.init(lines: [])}
	
	let lines: [String]
	
	init(lines: [String]) {
		self.lines = lines.sameWidths(padding: displayOff)
	}
	
	var height: Int {lines.count}
	var width: Int {lines.maxWidth()}
}
