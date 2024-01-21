// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

do {
	let font = try loadFont()
	
	let hello = font.glyph(from: "Hej", spaceBetweenCharacters: 2)
	let world = font.glyph(from: "världen", spaceBetweenCharacters: 2)
	let helloWorld = font.glyph(from: "Hej världen", spaceBetweenCharacters: 2)
	
	let panelWidth = 100
	
	displayPanel(left: hello, right: world, width: panelWidth)
	displayPanel(glyph: helloWorld, width: panelWidth)
	
} catch {
	print("Failed to run: \(error)")
	exit(1)
}

private func displayPanel(left: Glyph, right: Glyph, width: Int) {
	let glyphWidths = left.lines.maxWidth() + right.lines.maxWidth()
	assert(glyphWidths <= width)
	let spaceBetween = width - glyphWidths
	
	let glyph = [left, right].concatenate(spaceBetween: spaceBetween)
	
	displayPanel(glyph: glyph, width: width)
}

private func displayPanel(glyph: Glyph, width: Int) {
	assert(glyph.lines.maxWidth() <= width)
	
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
