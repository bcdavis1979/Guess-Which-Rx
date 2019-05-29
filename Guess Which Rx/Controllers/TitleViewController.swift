//
//  TitleViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/28/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Wait 5 seconds and then move on to mode selection
        let _ = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            self.performSegue(withIdentifier: "selectMode", sender: nil)
        }
    }
}
