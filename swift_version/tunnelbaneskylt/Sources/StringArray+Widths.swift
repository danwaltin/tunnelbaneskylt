//
//  StringArray+Widths+MaxWidth.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

extension Array where Element == String {
	func sameWidths(padding: String) -> [String] {
		let width = self.maxWidth()

		return self.map { String($0
			.padding(toLength: width, withPad: padding, startingAt: 0)) }
	}
	
	func maxWidth() -> Int {
		self.map {$0.count}.max() ?? 0
	}
}
