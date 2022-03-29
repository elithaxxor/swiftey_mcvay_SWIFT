//
//  mockTest.swift
//  ios_app
//
//  Created by a-robot on 3/28/22.
//

import SwiftUI
import Foundation

struct mockTestii: Identifiable{
    let id = UUID()
    let name : String
    let url : URL
    
}

struct mockTestListii{
    static let LCOTest = [
        mockTestii(
                 name: "Adel",
                 url: URL(string: "https://adelal.medium.com/")!),
    
    mockTestii(
             name: "Adel01",
             url: URL(string: "https://github.com/elithaxxor?tab=repositories")!)
]
}
