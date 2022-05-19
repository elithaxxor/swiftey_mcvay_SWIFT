//
//  PDFviewerApp.swift
//  Shared
//
//  Created by a-robota on 4/4/22.
//

import SwiftUI
import PDFKit

@main
class PDFviewerApp: App {
    typealias Body = <#type#>
    

        // views
        let PDFviewer = PDFView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubView(PDFviewer)
        
        PDFviewer.document = PDFDocumnt()  // obj to creat new pdf
        view.addSubview(pdfView)
        
        // unwrapping doc creater [info from swfit docs]
        // returns location and item in memory alotment. IE - fetch PDF doc.
        guard let url = Bundle.main.url(forResource: "swiftui", withExtension: "pdf") else{
            return
        }
        
        //  sort of like an init(); crate documnt object
        guard let document = PDFDocumnt(url : url) else {
            return
        }
        PDFviewer.document = document
        PDFviewer.delegate = self
        
        // Leveraging PDFviwer's methods
        var newDocument = PDFDocument()
      //  let page = PDFPage(image: UIImage(systemName:
        
    // must unwrap variable. make old page = new page.
        guard let page = PDFPage(image: UIImage(systemName: "house")!) else {
            return
        }
        
        newDocument.insert(page, at: 0) // currently inserts at idx 0
        pdfViewer.document = newDocument // erassignes the viewerapps parent to newDocumtn
        
    }
    
    override func viewDidLayoutSubviews(){
    super.viewDidLayoutSubviews()
        PDFviewer.frame = view.bounds
    }


}

