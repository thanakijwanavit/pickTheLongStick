//
//  TabView.swift
//  pickTheLongStick
//
//  Created by nic wanavit on 3/23/22.
//

import Foundation
import SwiftUI


struct MainTabView: View {
    static var standard = MainTabView()
    @AppStorage("tabSelection") var tabSelection = 0
//    private init(){}
    var body: some View {
        TabView(selection: $tabSelection){
            homeView
                .tabItem({
                    Label("home", systemImage: "house")
                })
                .tag(0)
            
            howItWorks
                .tabItem {
                    Label("how it works", systemImage: "questionmark.square.dashed")
                }
                .tag(1)
        }
    }
    
    
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView.standard
    }
}
