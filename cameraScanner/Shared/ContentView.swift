//
//  ContentView.swift
//  Shared
//
//  Created by a-robota on 4/3/22.
//

import SwiftUI
import CTScanText
// --> change the texr fields ScanTextField, because it is an object inilizer (swfit thing)

// UITextfield and UIKeyboard - custom UI Params. 
// @UIApplicationMain
public struct TextEditorScreen: View{
    @State private var name = ""
    @State private var company = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var address = ""
    @State private var website = ""

    

    public var body: some View{
        VStack {
            ScanTextField("Name", text: $name)
                .frame(height: 30)
                .textFieldStyle(.roundedBorder)
                .textContentType(.name)
                .keyboardType(.alphabet)
            
            ScanTextField("company", text: $company)
                .textContentType(.name)
                .keyboardType(.alphabet)
        Form{
            ScanTextField("email", text: $email)
                .textContentType(.name)
                .keyboardType(.emailAddress) // force proper input
            ScanTextField("phone", text: $phone)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad) // UI for text / num - force proper input
                
            ScanTextField("address", text: $address)
                .textContentType(.fullStreetAddress) // forc proepr input
                .keyboardType(.default)
            
            ScanTextField("website", text: $website)
                .textContentType(.URL) // forc proepr input
                .keyboardType(.URL)
            }
            Spacer()
        }.padding()
    }
}
    
struct TextEditorScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            TextEditorScreen()
    }
}
}





    
        
//            .frame(height: 210)
//            TextField(text: $text3)
//                .frame(height: 120)
//            TextField(text: $text1)
//                .frame(height: 120)
//            Spacer() // creates a fleixhale space that epcands thorugh stakc
//        }
//
        
    
