//
//  MainTabView+howItWorks.swift
//  pickTheLongStick
//
//  Created by nic wanavit on 3/23/22.
//

import Foundation
import SwiftUI
extension MainTabView{
    var howItWorks:some View{
        HowItWorks.standard
    }
}
extension MainTabView{
    struct HowItWorks:View{
        static var standard = HowItWorks()
        private init(){}
        var body: some View{
            VStack{
                Text(description)

            }
        }
        var description: String{
            return """
        1. choose the number of sticks to pull
        2. choose the number of short sticks
        3. pull a stick one by one
        """
        }
    }
    
}

struct HowItWorks_Preview: PreviewProvider{
    static var previews: some View {
        MainTabView.HowItWorks.standard
    }
}
