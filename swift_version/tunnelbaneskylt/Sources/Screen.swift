//
//  Screen.swift
//
//
//  Created by Dan Waltin on 2024-01-20.
//

import Foundation

struct Screen {
	let font: Font
	let spaceBetweenCharacters: Int
}

extension Screen {
	func displayString(_ s: String) -> [String] {
		guard let character = font.characters[s] else {
			return []
		}

		let characterLines = character.split(separator: "|")
		
		return characterLines.map { String($0
			.replacing("#", with: "*")
			.replacing(".", with: " ")) }
	}
}
