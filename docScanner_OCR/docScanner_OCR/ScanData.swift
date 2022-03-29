//
//  ScanData.swift
//  docScanner_OCR
//
//  Created by a-robot on 3/28/22.
//

import Foundation

struct ScanData: Identifiable{
    var id = UUID();
    let content: String
    
    init (content: String){
        self.content = content
    }
}
