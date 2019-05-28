//
//  ModeViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/28/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit

enum GameMode {
    case easy
    case normal
    case hard
}

class ModeViewController: UIViewController {

    var selectedGameMode : GameMode = .easy
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectCategory" {
            let destinationVC = segue.destination as! CategoryViewController
            destinationVC.selectedGameMode = self.selectedGameMode
        }
    }
    
    // MARK: - Mode selection actions
    

    @IBAction func modePressed(_ sender: Any) {
        let button = sender as! UIButton
        
        let buttonText = button.currentTitle!
        switch buttonText {
        case "Easy Mode": selectedGameMode = .easy
        case "Normal Mode": selectedGameMode = .normal
        case "Hard Mode": selectedGameMode = .hard
        default: selectedGameMode = .easy
        }
        performSegue(withIdentifier: "selectCategory", sender: self)
    }
}
