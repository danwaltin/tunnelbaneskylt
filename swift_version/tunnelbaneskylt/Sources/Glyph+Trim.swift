//
//  Glyph+Trim.swift
//  
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

extension Glyph {
	func trimRight(_ amount: Int) -> Glyph {
		assert(amount <= width)
		
		let newLines = lines.map{ String($0.prefix(width - amount))}
		
		return Glyph(lines: newLines)
	}
}
