//
//  ContentView.swift
//  DiceGame
//
//  Created by a-robota on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    // STATE
    @State var leftNum = 1
    @State var rightNum = 1
    
    var body: some View {
        ZStack{
            Spacer()
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image("diceeLogo")
                HStack{
                    DiceView(n: leftNum)
                    DiceView(n: rightNum)
                }
                VStack{
                    Button(action: { // Sets random #s for dice 
                        self.leftNum = Int.random(in: 1...6)
                        self.rightNum = Int.random(in: 1...6)
                    }) {
                        
                        Text("Roll")
                            .font(.system(size:30))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding(.horizontal)
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}
