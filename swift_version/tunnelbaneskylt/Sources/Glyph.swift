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
		let width = Self.width(lines)

		self.lines = lines.map { String($0
			.padding(toLength: width, withPad: displayOff, startingAt: 0)) }
	}
	
	var height: Int {lines.count}
	
	func appending(glyph: Glyph, spaceBetween: Int) -> Glyph {
		let maxHeight = max(height, glyph.height)
		
		let left = self.expand(toHeight: maxHeight)
		let right = glyph.expand(toHeight: maxHeight)
		
		var lines = [String]()

		for row in 0..<maxHeight {
			let line = left.lines[row] + spaces(spaceBetween) + right.lines[row]
			lines.append(line)
		}
		
		return Glyph(lines: lines)
	}

	private func expand(toHeight height: Int) -> Glyph {
		if self.height >= height {
			return self
		}
		
		let maxWidth = Self.width(lines)
		
		let numberOfExtraLines = height - lines.count
		
		var newGlyph = lines
		for _ in 0..<numberOfExtraLines {
			newGlyph.append(spaces(maxWidth))
		}
		
		return Glyph(lines: newGlyph)
	}
	
	private static func width(_ lines: [String]) -> Int {
		lines.map {$0.count}.max() ?? 0
	}
	
	private func spaces(_ n: Int) -> String {
		String(repeating: displayOff, count: n)
	}
}
