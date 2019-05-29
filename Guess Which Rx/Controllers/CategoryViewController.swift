//
//  CategoryViewController.swift
//  Guess Which Rx
//
//  Created by Chris Davis on 5/28/19.
//  Copyright © 2019 WECAT Apps, LLC. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController {
    
    let realm = try! Realm()
    var categories: Results<Category>?
    var selectedGameMode : GameMode?
    var selectedCategory : Category?

    let initialCategories : [String] = ["Analgesics", "Antibiotics", "Antidepressants", "Antiepileptic", "Antipsychotic", "Narcotics", "Opioids", "OTC"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
        if categories?.count ?? 0 == 0 { doInitialSetup() }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    // MARK: - IBActions
    
    @IBAction func buyPremium(_ sender: Any) {
        print("User selected to buy premium content")
    }
    
    
    // MARK: - Realm modification methods
    
    func doInitialSetup() {
        do {
            for category in initialCategories {
                let newCategory = Category()
                newCategory.name = category
                try realm.write {
                    realm.add(newCategory)
                }
            }
        } catch {
            print("Error saving categories to realm: \(error)")
        }
       categoryTableView.reloadData()
    }
    
    func loadCategories() {
        categories = realm.objects(Category.self)
        categoryTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGame" {
            let destinationVC = segue.destination as! GameViewController
            destinationVC.gameMode = selectedGameMode
            destinationVC.currentCategory = selectedCategory
            
        }
    }
}

extension CategoryViewController : UITableViewDelegate {
    // MARK: - TableView delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let category = categories?[indexPath.row] {
            selectedCategory = category
            performSegue(withIdentifier: "showGame", sender: nil)
        }
    }
}

extension CategoryViewController : UITableViewDataSource {
    // MARK: - TableView datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        if let category = categories?[indexPath.row] {
            let cellLabel = category.name + "   (" + String(category.drugs.count) + ")"
            cell.textLabel?.text = cellLabel
        } else {
            cell.textLabel?.text = "Unable to retrieve category from database"
        }
        
        return cell
    }
}
