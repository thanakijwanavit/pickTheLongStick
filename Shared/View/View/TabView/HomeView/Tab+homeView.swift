//
//  Tab+homeView.swift
//  pickTheLongStick
//
//  Created by nic wanavit on 3/23/22.
//

import Foundation
import SwiftUI
import Combine




extension MainTabView{
    var homeView: some View{
        NavigationView{
            HomeView.standard
                .navigationBarHidden(true)
        }
    }
    struct HomeView:View{
        static var standard = HomeView()
        private init(){
        }
        @AppStorage("numberOfPlayers") var numberOfPlayers = 5
        @AppStorage("numberOfLosers") var numberOfLosers = 1
        @State var losingNumbers: [Int] = []
        
        
        @State var shouldReset: Bool = false
        
        
        func updateLosingNumber(){
            var newLosingNumbers = [Int]()
            var numberPool = Array(0..<numberOfPlayers)
            for _ in 0..<numberOfLosers{
                let newNumber = numberPool.randomElement()!
                newLosingNumbers.append(newNumber)
                numberPool = numberPool.filter({$0 != newNumber})
            }
            self.losingNumbers = newLosingNumbers
        }
        
        var body: some View{
            VStack{
                header
                mainBody
            }
            .onChange(of: numberOfLosers, perform: { _ in
                updateLosingNumber()
            })
            .task {
                updateLosingNumber()
//                losingNumber = Int.random(in: 0..<numberOfPlayers)
            }
        }
        var header: some View{
            HStack{
                Button("reset"){
                    shouldReset = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        shouldReset = false
                    }
                }
                .buttonStyle(.bordered)
                .padding()
                
                VStack{
                    Text("short sticks: \(numberOfLosers)")
                        .padding(.all, 5)
                    HStack{
                        Button {
                            if numberOfLosers < (numberOfPlayers - 1){
                                numberOfLosers += 1
                            }
                        } label: {
                            Image(systemName: "plus.app")
                        }
                        Button {
                            if numberOfLosers > 1{
                                numberOfLosers -= 1
                            }
                        } label: {
                            Image(systemName: "minus.square")
                        }
                    }
                }
                    .padding()
                
                VStack{
                    Text("players: \(numberOfPlayers)")
                        .padding(.all, 5)
                    HStack{
                        Button {
                            numberOfPlayers += 1
                        } label: {
                            Image(systemName: "plus.app")
                        }
                        Button {
                            if numberOfPlayers > 2{
                                numberOfPlayers -= 1
                            }
                        } label: {
                            Image(systemName: "minus.square")
                        }
                    }
                }
                    .padding()
                

            }
        }
        var mainBody: some View{
            ZStack{
                fries
                friesBox
            }
        }
        var friesBox: some View{
            VStack{
                Spacer()
                Rectangle()
                    .foregroundColor(.red)
                    .cornerRadius(10)
                    .frame(height: 200, alignment: .center)
                    .padding(.bottom)
                    .padding(.horizontal, 5)
            }
            
        }
        
        var fries: some View{
            ScrollView(.horizontal){
                HStack(alignment: .bottom){
                    ForEach(0..<numberOfPlayers, id: \.self){ player in
                        Fries(shouldReset: $shouldReset, friesId: player, isShort: losingNumbers.contains(player))
                            
                            
                    }
                }
                .frame( height: 500)
            }
        }
        
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(tabSelection: 0)
    }
}

