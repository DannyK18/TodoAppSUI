//
//  TodoAppSUIApp.swift
//  TodoAppSUI
//
//  Created by Daniel on 05.12.2022.
//

import SwiftUI

@main
struct TodoAppSUIApp: App {
    @StateObject var listVM = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(listVM)
        }
    }
}
