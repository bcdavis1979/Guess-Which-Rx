//
//  DrugDetailViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/29/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class DrugDetailViewController: UIViewController {

    let realm = try! Realm()
    var drugSelected : Drug?
    var answerDrug : Bool = false
    var gameStart = Date()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.updateTimeTaken()
        }
        let interval = Date().timeIntervalSince(gameStart)
        timeTaken.text = "Time Taken: \(formatInterval(interval))"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let drug = drugSelected {
            self.topNavBar.title = drug.name
            
            if drug.markedWrong {
                notDrugButton.backgroundColor = UIColor.flatYellow
                notDrugButton.setTitle("This COULD be the drug", for: .normal)
            } else {
                notDrugButton.backgroundColor = UIColor.flatRed
                notDrugButton.setTitle("THIS IS NOT THE DRUG", for: .normal)
            }
        }
        
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
    
    // MARK: - IBActions
    
    @IBAction func backToGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func notTheDrug(_ sender: Any) {
        do {
            try realm.write {
                drugSelected?.markedWrong = !drugSelected!.markedWrong
            }
        } catch {
            print("failed to mark drug wrong, \(error)")
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func correctDrugPicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quitGame(_ sender: Any) {
        timer.invalidate()
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var timeTaken: UILabel!
    
    @IBOutlet weak var topNavBar: UINavigationItem!
    
    @IBOutlet weak var notDrugButton: UIButton!
}
