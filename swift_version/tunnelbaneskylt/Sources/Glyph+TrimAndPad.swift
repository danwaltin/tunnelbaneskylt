//
//  Glyph+TrimAndPad.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

extension Glyph {
	func trimLeft(_ amount: Int) -> Glyph {
		let newLines = lines.map{ String($0.suffix(max(0, width - amount)))}
		
		return Glyph(lines: newLines)
	}

	func trimRight(_ amount: Int) -> Glyph {
		let newLines = lines.map{ String($0.prefix(max(0, width - amount)))}
		
		return Glyph(lines: newLines)
	}
	
	func padLeft(_ amount: Int) -> Glyph {
		let newLines = lines.map{ amount.spaces() + $0 }
		
		return Glyph(lines: newLines)
	}
	
	func padRight(_ amount: Int) -> Glyph {
		let newLines = lines.map{ $0 + amount.spaces() }
		
		return Glyph(lines: newLines)
	}
}
