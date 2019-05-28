//
//  Category.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/28/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import Foundation
import RealmSwift


class Category : Object {
    @objc dynamic var name : String = ""
    
    let drugs = List<Drug>()
}
