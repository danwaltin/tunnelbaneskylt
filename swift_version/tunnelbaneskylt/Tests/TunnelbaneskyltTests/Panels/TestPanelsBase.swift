//
//  TestPanelsBase.swift
//  
//
//  Created by Dan Waltin on 2024-01-21.
//

import Foundation

class TestPanelsBase: TestBase {
	var panelWidth: Int?
	
	override func setUp() {
		super.setUp()
		
		panelWidth = nil
	}
	
	func given_panelWidth(_ width: Int) {
		panelWidth = width
	}
}
