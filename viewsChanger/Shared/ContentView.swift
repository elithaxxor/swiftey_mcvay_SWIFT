//
//  contentView.swift
//  viewsChanger
//
//  Created by a-robota on 4/4/22.
//

import Foundation
import SwiftUI

struct ContentView: View {
    var body: some View{
        NavigationView { // sets homeview
            HomeView()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View{
        NavigaionView{
            HomeView()
            
        }
    }
}
