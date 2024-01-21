// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation


do {
	let font = try loadFont(filename: "typsnitt_a")
		
	let environment = Environment(
		font: font,
		panelWidth: 150,
		spaceBetweenCharacters: 2,
		color: .bit8(v: 167),
		animationFramesPerSecond: 24)
	let console = Console()
	
	let topPanel = StaticPanel(left: "17 Hässelby", right: "2 min", environment: environment)
	var bottomPanel = ScrollingPanel(string: "Hej världen", environment: environment)

	console.clearScreen()
	
	while true {
		console.moveCursorToTop(row: 3)
		display(panel: topPanel, environment: environment, console: console)
		print("")
		display(panel: bottomPanel, environment: environment, console: console)
		bottomPanel.scrollLeft()
		Thread.sleep(forTimeInterval: environment.animationSleepInterval)
	}
	
} catch {
	print("Failed to run: \(error)")
	exit(1)
}

private func display(panel: Panel, environment: Environment, console: Console) {
	let glyph = panel.display()

	console.setColor(environment.color)
	for line in glyph.lines {
		print(line)
	}
	console.reset()

//	print("+-" + String(repeating: "-", count: width) + "-+")
//	print("| " + String(repeating: " ", count: width) + " |")
//	for line in glyph.lines {
//		print("| " + line + " |")
//	}
//	print("| " + String(repeating: " ", count: width) + " |")
//	print("+-" + String(repeating: "-", count: width) + "-+")
}

enum FontException: Error {
	case couldNotFindFontFile(fileName: String)
	case couldNotReadFontContent(fromUrl: URL)
}

private func loadFont(filename: String, fileExtension: String = "json") throws -> Font {
	guard let fontUrl = Bundle.module.url(forResource: filename, withExtension: fileExtension) else {
		throw FontException.couldNotFindFontFile(fileName: "\(filename).\(fileExtension)")
	}

	guard let fontContent = try String(contentsOf: fontUrl).data(using: .utf8) else {
		throw FontException.couldNotReadFontContent(fromUrl: fontUrl)
	}

	let font = try JSONDecoder().decode(Font.self, from: fontContent)

	return font
}
