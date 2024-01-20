// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "tunnelbaneskylt",
    targets: [
        .executableTarget(
            name: "tunnelbaneskylt",
			resources: [
				.process("typsnitt_a.json")
			]
		),
		.testTarget(
			name: "TunnelbaneskyltTests",
			dependencies: [
				.byName(name: "tunnelbaneskylt")])
    ]
)
