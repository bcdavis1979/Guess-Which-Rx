//
//  DrugDetailViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/29/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit
import RealmSwift

class DrugDetailViewController: UIViewController {

    let realm = try! Realm()
    var gameController : GameViewController?
    var answerDrug : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topNavBar.title = "Drug name goes here"
    }
    
    // MARK: - IBActions
    
    @IBAction func backToGame(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func notTheDrug(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func correctDrugPicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func quitGame(_ sender: Any) {
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var timeTaken: UILabel!
    
    @IBOutlet weak var topNavBar: UINavigationItem!
}
