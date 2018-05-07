//
//  ClothingTableViewController.swift
//  DMK
//
//  Created by Bridget Legaspi on 05/05/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import UIKit
import os.log

class ClothingTableViewController: UITableViewController {
  
    // MARK: Properties
    var clothes = [Clothing]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem

        // Load sample data
        loadSampleClothes()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clothes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "clothingTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClothingTableViewCell else {
            fatalError("The dequeued cell is not an instance of clothingTableViewCell.")
        }
        
        let clothing = clothes[indexPath.row]
        cell.clothBrand.text = clothing.brand
        cell.clothIcon.image = clothing.imageIcon

        switch clothing.classifiction {
        case 1: cell.clothClassification.text = "Top"
        case 2: cell.clothClassification.text = "Bottom"
        case 3: cell.clothClassification.text = "Dress"
        default: cell.clothClassification.text = String(clothing.classifiction)
        }
        
        switch clothing.subclass {
        case 1: cell.clothSubclass.text = "Short Sleeves"
        case 2: cell.clothSubclass.text = "No sleeves"
        case 3: cell.clothSubclass.text = "Sweater"
        case 4: cell.clothSubclass.text = "Jacket"
        case 5: cell.clothSubclass.text = "Shorts"
        case 6: cell.clothSubclass.text = "Pants"
        case 7: cell.clothSubclass.text = "Skirt"
        case 8: cell.clothSubclass.text = "Dress"
        default: cell.clothSubclass.text = String(clothing.subclass)
        }
        
        switch clothing.status {
        case 1: cell.clothStatus.text = "Out of the closet"
        case 2: cell.clothStatus.text = "In of the closet"
        default: cell.clothStatus.text = String(clothing.status)
        }
        
        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            clothes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "AddClothing":
            os_log("Adding a new garment.", log: OSLog.default, type: .debug)
            
        case "ShowDetails":
            guard let clothingDetailViewController = segue.destination as? ClothingViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedClothingCell = sender as? ClothingTableViewCell else {
                fatalError("Unexpected sender: \(sender ?? "")")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedClothingCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedGarment = clothes[indexPath.row]
            clothingDetailViewController.clothing = selectedGarment
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    
    // MARK: Actions
    @IBAction func unwindToClothingList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ClothingViewController, let clothing = sourceViewController.clothing {
            
            // Update an existing clothing.
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                clothes[selectedIndexPath.row] = clothing
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            
            // Add a new garment.
            else {
                let newIndexPath = IndexPath(row: clothes.count, section: 0)
                clothes.append(clothing)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    // MARK: Private methods
    
    private func loadSampleClothes() {
        let photo1 = UIImage(named: "dress")
        let photo2 = UIImage(named: "jacket")
        let photo3 = UIImage(named: "sleeveless")
        let photo4 = UIImage(named: "pants")
        
        guard let dress = Clothing(brand: "Cotton On", classification: 3, subclass: 8, color: "Blue", id: 1, material: "Material1", status: 1, weather: 1, imageIcon: photo1) else {
            fatalError("Unable to instantiate dress")
        }
        
        guard let jacket = Clothing(brand: "Uniqlo", classification: 1, subclass: 4, color: "Blue", id: 1, material: "Material1", status: 2, weather: 1, imageIcon: photo2) else {
            fatalError("Unable to instantiate jacket")
        }
        
        guard let sleeveless = Clothing(brand: "Ukay", classification: 1, subclass: 2, color: "Blue", id: 1, material: "Material1", status: 1, weather: 1, imageIcon: photo3) else {
            fatalError("Unable to instantiate jacket")
        }
        
        guard let pants = Clothing(brand: "H&M", classification: 2, subclass: 6, color: "Blue", id: 1, material: "Material1", status: 2, weather: 2, imageIcon: photo4) else {
            fatalError("Unable to instantiate pants")
        }
        guard let shirt = Clothing(brand: "Zara", classification: 1, subclass: 1, color: "Blue", id: 1, material: "Material1", status: 1, weather: 1, imageIcon: UIImage(named: "shirt2")) else {
                fatalError("Unable to instantiate pants")
        }
        clothes += [dress, jacket, sleeveless, pants, shirt]
    }
}
