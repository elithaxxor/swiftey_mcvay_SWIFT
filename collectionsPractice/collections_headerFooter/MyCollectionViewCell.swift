//
//  MyCollectionViewCell.swift
//  collections_headerFooter
//
//  Created by a-robot on 4/3/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    static let identifier =  "MyCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .link
        
        
    }

}
