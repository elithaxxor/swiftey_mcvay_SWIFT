//
//  ViewController.swift
//  docScanner_OCR
//
//  Created by a-robot on 3/28/22.
//

import UIKit
import SwiftUI


struct ContentView: View {
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = [//takes binary from scanned data
        var body : some View {
        NavigationView{
            VStack{
                if texts.count > 0 {
                    List{
                        ForEach(texts){text in
                        NavigationLink(
                            destination: ScrollView{Text(text.content)},
                            
                            label: {
                                Text(text.content).lineLimit(1)
                            
                            })
                    }
                    }
                }
            }
            .navigationTitle("[+] Document Scanner [+]")
            .navigationBarItems(trailing:
            
            Button(action: {
                self.showScannerSheet = true
            },
            label:{
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
                
            }).sheet(isPresented: $showScannerSheet, content: { } ))
        }
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
        
    }
}
