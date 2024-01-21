// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

do {
	let font = try loadFont()
		
	let environment = Environment(font: font, panelWidth: 100, spaceBetweenCharacters: 2)
	
	let topPanel = StaticPanel(left: "Hej", right: "världen", environment: environment)
	let bottomPanel = ScrollingPanel(string: "Hej världen", environment: environment)

	display(panel: topPanel, environment: environment)
	display(panel: bottomPanel, environment: environment)

} catch {
	print("Failed to run: \(error)")
	exit(1)
}

private func display(panel: Panel, environment: Environment) {
	let glyph = panel.display()
	let width = environment.panelWidth
	
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
