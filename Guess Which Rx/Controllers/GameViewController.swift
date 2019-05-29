//
//  GameViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/29/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit
import RealmSwift

class GameViewController: UIViewController {

    // MARK: - Mutable Properties
    var tempArray = ["blah", "stuff", "things", "junk", "balls", "butthole", "long drugname", "longer drugname", "this is a very long drugname", "duck", "dog","cat","rat","locutus"]
    var currentCategory : Category?
    var gameMode : GameMode?
    
    // MARK: - Immutable Properties
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
    private let itemsPerRow : CGFloat = 3
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK: - IBOutlets
    
    @IBOutlet weak var timeTaken: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func quitGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension GameViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDrugDetails", sender: nil)
    }
}

extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "drugCell", for: indexPath) as! DrugCollectionViewCell
        
        cell.drugName.text = tempArray[indexPath.row]
        
        return cell
    }
}

extension GameViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
