//
//  URLS.swift
//  ImageFetcher
//
//  Created by a-robota on 5/22/22.
//

import Foundation

// var bundleURL: URL { get }


struct URLS
{
 //   static let URL01 = Bundle.main.url(forResource: "firstPic", withExtension: "jpg")
    static let URL02 = URL(string: "https://www.rd.com/wp-content/uploads/2015/04/01_My-Shadow-FINAL.jpg?resize=1536,1024/")
    
    static var moreURLS : Dictionary<String, URL> = {
        let urlArray = [
            "image01" : "https://www.rd.com/wp-content/uploads/2015/04/03_Phantasmagoria-FINAL.jpg?resize=1536,1024",
            "image02" : "https://www.rd.com/wp-content/uploads/2015/04/04_The-Elephant-FINAL-1.jpg?resize=1536,1024",
            "image03" : "https://www.rd.com/wp-content/uploads/2015/04/06_Carrot-FINAL.jpg?resize=1536,1024"
        ]
        
        var urls = Dictionary<String, URL>() // Empty dict 
        for (key, value) in urlArray {
            urls[key] = URL(string: value)
        }
        return urls
    }()
}

