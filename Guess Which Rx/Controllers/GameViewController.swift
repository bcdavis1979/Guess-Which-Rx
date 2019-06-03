//
//  GameViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/29/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class GameViewController: UIViewController {

    // MARK: - Mutable Properties
    var currentDrugs : Results<Drug>?
    var selectedDrug : Drug?
    var currentCategory : Category? {
        didSet {
            loadDrugs()
        }
    }
    var gameMode : GameMode?
    
    // MARK: - Immutable Properties
    private let sectionInsets = UIEdgeInsets(top: 20.0,
                                             left: 20.0,
                                             bottom: 20.0,
                                             right: 20.0)
    
    private let itemsPerRow : CGFloat = 3
    
    private let gameStart : Date = Date()
    
    private var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.updateTimeTaken()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    // MARK: - Model manipulation methods
    
    func loadDrugs() {
        currentDrugs = currentCategory?.drugs.sorted(byKeyPath: "name", ascending: true)
    }
    
    // MARK: - game methods
    
    func formatInterval(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.minute, .second]
        
        if duration >= 3600 {
            formatter.allowedUnits.insert(.hour)
        }
        
        return formatter.string(from: duration)!
    }
    
    func updateTimeTaken() {
        let interval = Date().timeIntervalSince(gameStart)
        timeTaken.text = "Time Taken: \(formatInterval(interval))"
    }
    

    // MARK: - IBOutlets
    
    @IBOutlet weak var timeTaken: UILabel!
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - IBActions
    
    @IBAction func quitGame(_ sender: Any) {
        timer.invalidate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDrugDetails" {
            let destinationVC = segue.destination as! DrugDetailViewController
            destinationVC.drugSelected = selectedDrug
            destinationVC.gameStart = self.gameStart
        }
    }
}

extension GameViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDrug = currentDrugs![indexPath.row]
        performSegue(withIdentifier: "showDrugDetails", sender: nil)
    }
}

extension GameViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentDrugs?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "drugCell", for: indexPath) as! DrugCollectionViewCell
        
        if let drug = currentDrugs?[indexPath.row] {
            cell.drugName.text = drug.name
            if drug.markedWrong {
                cell.drugName.backgroundColor = UIColor.flatGray
            } else {
                cell.drugName.backgroundColor = UIColor.flatSkyBlue
            }
        } else { cell.drugName.text = "Error" }
        
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
