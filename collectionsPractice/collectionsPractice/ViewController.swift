//
//  ViewController.swift
//  collectionsPractice
//
//  Created by a-robot on 4/2/22.
// https://developer.apple.com/documentation/Xcode/Xcode-Cloud

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [for collectionviewflow]
        let layout = UICollectionViewDelegateFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        
        
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}


/*                  [picks up interactions with cells] --> allows interactions.
    * The delegate object is responsible for managing selection behavior and interactions
    * with individual items. ...
    ***** https://developer.apple.com/documentation/uikit/uicollectionviewdelegate ******
 */
extension ViewController: UICollectionViewDelegate{
    /* Tells the delegate that the item at the specified index path was selected. */
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        collectionView.deselectItem(at: indexPath, animated: true)
        print("tapped")
    }
}

/*
  A data source object manages the data in your collection view. It represents your app's data model and vends information to the collection view as needed. It also creates and configures the cells and supplementary views that the collection view uses to display your data.
                 https://developer.apple.com/documentation/uikit/uicollectionviewdiffabledatasource
                https://developer.apple.com/documentation/uikit/uicollectionviewdatasource
*/
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, // required
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.id, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: UIImage(named: "image")!)
        return cell
        		
    }

    func collectionView(_ collectionView: UICollectionView, // required --> how many cells in speciefied section.
                        numberOfItemsInSection section: Int) -> Int { return 12
    }
}
// [USED FOR CUSTOM LAYOUTS] (changes the cell)-> work with the collection views layout
extension ViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath ) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}



