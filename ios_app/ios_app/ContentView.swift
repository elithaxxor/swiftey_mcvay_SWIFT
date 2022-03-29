//
//  ContentView.swift
//  ios_app
//
//  Created by a-robot on 3/28/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    // to import local data structures
    @State private var firstName = ""
    @State private var lastname = ""
    @State private var email = ""
    
    var mockTestii : [mockTestii] = mockTestListii.LCOTest
    var body: some View {
        
        NavigationView{

            VStack{
                 Image("me")
//                Image.layer.cornerRadius = Image.frame.size.width / 2
//                Image.clipsToBounds = true
//                    .resizable()
//                    .scaledToFit()
                
            Form {
//                Section(header: Text("Let's Stay In Touch! "),
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastname)
                TextField("Email", text: $email)
                }
          
        }.navigationBarTitle("Welcome :)")
            .toolbar{
//                ToolbarItemGroup(placement: .navigationBarLeading)
                Button("Save"){
                    print("Save Clicked")
                }.accentColor(.red)
                Button("Clear"){
                    print("Clear Tapped")
                }
            }
        
                
        List(mockTestii, id:\.id) { item in
            Text("Hello, world!")
                .padding()
       
        HStack{
            Image(item.name)
                .resizable()
                .scaledToFit()
                .frame(height: 90)
                .padding(.horizontal, 7)
        }
        VStack(alignment: .leading, spacing: 20){
            Text("Test Template, first [IOS APP]")
                .fontWeight(.medium)
                .font(.headline)
            Text("Click on my medium!\(item.url)")
                .fontWeight(.medium)
                .font(.headline)
                .foregroundColor(.gray)
        }}
            }.accentColor(.red)
}
}

struct HeaderView: View {

    var footer: some View {
        var player: AVAudioPlayer?
        func playSound() {
            guard let url = Bundle.main.url(forResource: "soundName", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = player else {   return AnyView }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
        }
    }








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            playSound()
            ContentView()
                .padding(.top)
                .accessibilityAddTraits([.isLink])
                .preferredColorScheme(.dark)
                .accessibilityElement(children: /*@START_MENU_TOKEN@*/.contain/*@END_MENU_TOKEN@*/)
            ContentView()
                .padding(.top)
                .accessibilityAddTraits([.isLink])
                .preferredColorScheme(.dark)
                .accessibilityElement(children: /*@START_MENU_TOKEN@*/.contain/*@END_MENU_TOKEN@*/)
            ContentView()
            
        }
    }
}
