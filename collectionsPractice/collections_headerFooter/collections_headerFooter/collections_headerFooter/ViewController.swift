//
//  ViewController.swift
//  collections_headerFooter
//
//  Created by a-robot on 4/3/22.
// [SAMPLE HEADER/FOOTER w/ Collections]

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // iniliize
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // [VIEWS LAYOUT]
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0)
        layout.itemSize = CGSize(width: view.frame.size.width/2.2, height: view.frame.size.width/2.2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        /// ---> [REGISTRATION]
        // [REGISTER NIB]
        collectionView?.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        
        // [REGISTER HEADING]
        collectionView?.register(HeaderCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: HeaderCollectionReusableView.identifier)
        
       // [REGISTER FOOTER]
        collectionView?.register(FooterCollectionReusableView.self,
                                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                 withReuseIdentifier: FooterCollectionReusableView.identifier)
        
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        
        view.addSubview(collectionView!) // adds subview to the main
        
        
    } // FOR SUBVIEW (view.addSubview)
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    
    //[# OF SECTIONS]
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 3
    }
    // [# OF CELLS]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // [FOR GRID CELLS]
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }

    
    // [FOR HEADER]
    func collectionView  (_ collectionView: UICollectionView, viewForSupplementaryElementOfKind
                          kind: String, at indexPath: IndexPath ) ->
                            UICollectionReusableView{
            
            //[DEQUE]  [DEQUE]
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath)
            as! HeaderCollectionReusableView
            
            // [reads config setup in header page]
            header.configure()
            return header
    }
    
    // [FOR FOOTER]-->[DEQUE]
    func collectionView  (_ collectionView: UICollectionView, viewForSupplementaryElementOfSomeKind kind: String, at indexPath: IndexPath )
            -> UICollectionReusableView {
            
        if kind == UICollectionView.elementKindSectionFooter {
        //[DEQUE]
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReusableView.identifier, for: indexPath)
        as! FooterCollectionReusableView
        
        // [reads config setup in footer page]
        footer.configure()
        return footer
    }
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath)
                as! HeaderCollectionReusableView
                
                // [reads config setup in header page]
                header.configure()
                return header
            }
    

    
    //[HEADER] --> REFERENCE SIZE FOR WINDOW
    func collectionView  (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: view.frame.size.width, height: 200)

}
    //[FOOTER] --> REFERENCE SIZE FOR WINDOW
    func collectionView  (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) ->
        CGSize{
                return CGSize(width: view.frame.size.width, height: 200)

}

}
