//
//  MyCollectionViewCell.swift
//  collectionsPractice
//
//  Created by a-robot on 4/2/22.
// https://developer.apple.com/documentation/uikit/uiimageview
/* A UINib object caches the contents of a nib file in memory, ready for unarchiving and instantiation. When your app needs to instantiate the contents of the nib file, it can do so without having to load the data from the nib file first, which improves performance.
 */


import UIKit


// to show and display images
class MyCollectionViewCell: UICollectionViewCell {
    // create image object
    
    static let id = "MyCollectionViewCell"
    
    @IBOutlet var i: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // [for dequeing of cell] --> allows for function access, rather than class
    public func configure(with image: UIImage) {
        i.image = image
    }
    
    // used to identify nib
    /* https://developer.apple.com/documentation/uikit/uinib*/
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}


