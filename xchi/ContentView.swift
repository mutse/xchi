//
//  ContentView.swift
//  xchi
//
//  Created by Mutse Yang on 2023/11/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Me")
                .navigationTitle("xChi App")
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .frame(minWidth: 800, minHeight: 600)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: showAbout) {
                    Image(systemName: "info.circle")
                }
                .help("About")
            }
        }
    }

    func showAbout() {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "N/A"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "N/A"
        let copyright = "Copyright © 2023 mutse.me. All rights reserved."
        let aboutText = "Version: \(version)\nBuild: \(build)\n\n\(copyright)"
        
        guard let logoImage = NSImage(named: "AppIcon") else {
            fatalError("Unable to load logo image.")
        }
        
        let alert = NSAlert()
        alert.messageText = "About XChin App"
        alert.informativeText = aboutText
        alert.icon = logoImage

        alert.addButton(withTitle: "OK")
        alert.runModal()
    }
}
