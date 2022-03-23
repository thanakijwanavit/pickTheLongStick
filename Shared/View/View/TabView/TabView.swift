//
//  TabView.swift
//  pickTheLongStick
//
//  Created by nic wanavit on 3/23/22.
//

import Foundation
import SwiftUI


struct TabView: View {
    static var standard = TabView()
    private init(){}
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView.standard
    }
}
