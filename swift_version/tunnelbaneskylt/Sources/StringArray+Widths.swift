//
//  StringArray+MaxWidth.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

extension Array where Element == String {
	func maxWidth() -> Int {
		self.map {$0.count}.max() ?? 0
	}
}
