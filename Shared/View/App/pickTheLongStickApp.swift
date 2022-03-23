//
//  pickTheLongStickApp.swift
//  Shared
//
//  Created by nic wanavit on 3/23/22.
//

import SwiftUI

@main
struct pickTheLongStickApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .task {
                    await postInit()
                }
        }
    }
}


