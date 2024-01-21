// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

let fontFilename = "typsnitt_a"
let fontFileExtension = "json"
guard let fontUrl = Bundle.module.url(forResource: fontFilename, withExtension: fontFileExtension) else {
	print("Could not create find font file \(fontFilename).\(fontFileExtension)")
	exit(1)
}

guard let fontContent = try String(contentsOf: fontUrl).data(using: .utf8) else {
	print("Failed to read font content from \(fontUrl)")
	exit(1)
}

let font = try JSONDecoder().decode(Font.self, from: fontContent)
let screen = Screen(font: font, spaceBetweenCharacters: 2)

let text = screen.displayString("Hej världen")

print("")
for line in text {
	print(line)
}
print("")

