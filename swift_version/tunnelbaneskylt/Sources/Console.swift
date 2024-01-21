//
//  Console.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

fileprivate let ESC = "\u{001B}"

struct Console {
	enum Color {
		case red
		case yellow
		case lightRed
		case lightYellow
		case bit8(v: UInt8)

		var code: String {
			switch self {
			case .red: return "31m"
			case .yellow: return "33m"
			case .lightRed: return "91m"
			case .lightYellow: return "93m"
			case .bit8(let v): return "38;5;\(v)m"
			}
		}
	}
	
	func clearScreen() {
		printCode("2J")
	}
	
	func moveCursorToTop(row: Int) {
		printCode("\0\(row);0H")
	}
	
	func setColor(_ color: Color) {
		printCode(color.code)
	}
	
	func reset() {
		printCode("0m")
	}
	
	private func printCode(_ code: String) {
		let escaped = "\u{001B}[\(code)"
		print(escaped, terminator: "")
	}
}
