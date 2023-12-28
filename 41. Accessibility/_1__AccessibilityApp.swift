//
//  _1__AccessibilityApp.swift
//  41. Accessibility
//
//  Created by Sesili Tsikaridze on 27.12.23.
//

import SwiftUI

@main
struct _1__AccessibilityApp: App {
    @State var viewModel = NewsViewModel()
    var body: some Scene {
        WindowGroup {
            NewsView()
                .environmentObject(viewModel)
        }
    }
}
