//
//  ContentView.swift
//  businessCard
//
//  Created by a-robota on 4/19/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red:0.08, green:0.60, blue:0.63)
                .edgesIgnoringSafeArea(.all)
                .border(Color.white, width: 3)
            VStack{
    
                Image("wsb") // Circle Image View 
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth:4))
                Divider()

            Text("WSB!!") // Text Under Image
                    .font(Font.custom("Dancing_Script", size: 35)) // custom font, from google fonts (info.plist)
                .bold()
                .foregroundColor(.white)
            
            Divider()
            Text("Scam Artist")
                .foregroundColor(.white)
                .font(.system(size:20))
            Divider()
                InfoView(text: "Elit_Scammer", imageName: "mount")

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
