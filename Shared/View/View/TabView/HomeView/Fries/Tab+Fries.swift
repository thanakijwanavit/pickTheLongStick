//
//  Tab+Fries.swift
//  pickTheLongStick
//
//  Created by nic wanavit on 3/23/22.
//

import Foundation
import SwiftUI

//Mark: fries stick
extension MainTabView.HomeView{
    struct Fries:View{
        @Binding var shouldReset:Bool
        @State var offset: CGFloat = 0
        var friesId:Int
        var isShort:Bool
        @State var activated: Bool = false
        @State var gameIsLost:Bool = false
        var randomeSpace = CGFloat.random(in: 20...50)
        var body: some View{
            VStack{
//                Text("\(friesId)")
//                Spacer()
                mainBody
                    .sheet(isPresented: $gameIsLost) {
                        VStack{
                            Text("you lost")
                            Button("reset"){
                                shouldReset = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    shouldReset = false
                                    gameIsLost = false
                                }
                            }
                        }
                    }
            }
        }
        var mainBody: some View {
            stick
                .offset(x: 0, y: offset)
                .highPriorityGesture(DragGesture().onChanged({ drag in
                    guard !activated else {return}
                    offset = drag.translation.height
                }).onEnded({ _ in
                    guard !activated else {return}
                    offset = -150
                    self.activated = true
                    if isShort{
                        gameIsLost = true
                    }
                }))
                .onChange(of: shouldReset) { newValue in
                    if newValue == true{
                        activated = false
                        offset = 0
                    }
                }
        }
        
        
        var stick: some View{
            VStack{
                Rectangle()
                    .frame(width: 20, height: isShort ? 150:200, alignment: .center)
                    .foregroundColor(.yellow)
                    .cornerRadius(10)
                    .border(.mint)
                if isShort{
                    Spacer()
                        .frame(height:50)
                }
                if !activated{
                    Spacer()
                        .frame(height: randomeSpace)
                }
            }
            .padding()
            
           
        }
    }
}


struct Fries_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(tabSelection: 0)
    }
}

