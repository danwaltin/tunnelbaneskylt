// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

do {
	let font = try loadFont()
	
	let text = font.glyph(from: "Hej världen", spaceBetweenCharacters: 2)
	let width = text.lines.maxWidth()
	displayPanel(glyph: text, width: width)
	
} catch {
	print("Failed to run: \(error)")
	exit(1)
}

private func displayPanel(glyph: Glyph, width: Int) {
	print("+-" + String(repeating: "-", count: width) + "-+")
	print("| " + String(repeating: " ", count: width) + " |")
	for line in glyph.lines {
		print("| " + line + " |")
	}
	print("| " + String(repeating: " ", count: width) + " |")
	print("+-" + String(repeating: "-", count: width) + "-+")
}

enum FontException: Error {
	case couldNotFindFontFile(fileName: String)
	case couldNotReadFontContent(fromUrl: URL)
}

private func loadFont() throws -> Font {
	let fontFilename = "typsnitt_a"
	let fontFileExtension = "json"
	guard let fontUrl = Bundle.module.url(forResource: fontFilename, withExtension: fontFileExtension) else {
		throw FontException.couldNotFindFontFile(fileName: "\(fontFilename).\(fontFileExtension)")
	}

	guard let fontContent = try String(contentsOf: fontUrl).data(using: .utf8) else {
		throw FontException.couldNotReadFontContent(fromUrl: fontUrl)
	}

	let font = try JSONDecoder().decode(Font.self, from: fontContent)

	return font
}
