//
//  Environment.swift
//
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

struct Environment {
	let font: Font
	let panelWidth: Int
	let spaceBetweenCharacters: Int
	let color: Console.Color
	let animationFramesPerSecond: Int
	
	init(font: Font, 
		 panelWidth: Int,
		 spaceBetweenCharacters: Int,
		 color: Console.Color = .lightYellow,
		 animationFramesPerSecond: Int = 24) {
		self.font = font
		self.panelWidth = panelWidth
		self.spaceBetweenCharacters = spaceBetweenCharacters
		self.color = color
		self.animationFramesPerSecond = animationFramesPerSecond
	}
	
	var animationSleepInterval: TimeInterval {1.0 / Double(animationFramesPerSecond)}
}
