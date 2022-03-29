//
//  File.swift
//  ios_app
//
//  Created by a-robot on 3/28/22.
//

import Foundation
import SwiftUI

struct mockTest{
    let imageName: String
    let title: String
    let description: String
    let sellPrice: String
    let originalPrice: String
    let url: URL
    
}
struct mockTestList{
    static let LCOTest = [
        mockTest(imageName: "Generic insert #1",
                 title: "Generic Title #1",
                 description: "Generic Description #1",
                 sellPrice: "Generice Sale Price #1",
                 originalPrice: "Generic Original Price #1",
                 url: URL(string: "adelal.medium.com")!),
                ] }
