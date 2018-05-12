//
//  ClothingTableViewController.swift
//  DMK
//
//  Created by Bridget Legaspi on 05/05/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import UIKit
import os.log
import Alamofire
import SwiftyJSON

class ClothingTableViewController: UITableViewController {
  
    // MARK: Properties
    var clothes = [Clothing]()
    
    var idSave = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem

        // Load sample data
        loadSampleClothes()
    }
    
    @IBAction func refreshButton(_ sender: Any) {
//        print("hello!")
        //Do GET here. GET all the data, put it into a data structure.
            Alamofire.request("https://damitan-mo-ko.herokuapp.com/mobileget").responseJSON { (responseData) -> Void in //Like our get request
                if((responseData.result.value) != nil) {
                    var i = 0
                    var arr = [[String]]()
                    
                    self.clothes.removeAll()
                    self.tableView.reloadData()
//                    print(self.clothes)
                    
                    // insert action that deletes all your data from the model here
                    // e.g. self.arrayOfRows = []
                    
                    /* Appending properly and accessing individual elements
                    arr.append([])
                    arr[0].append("hello")
                    arr.append([])
                    print(arr)
                    */
                    
                    /*color, status, id, weather, classification, material, brand */
                    // Read classification for the kind of clothing. It is in that order. arr[0][1] accesses the array's first instance's 2nd field. 
                    
                    let json = JSON(responseData.result.value!)
                    print(json)
                    
                    //Do the code here.
                    for item in json["sweater"].arrayValue {
                        arr.append([])
                        print("sweater")
//                        print(item)
                        arr[i].append(item["color"].stringValue)
                        arr[i].append(item["status"].stringValue)
                        arr[i].append(item["id"].stringValue)
                        arr[i].append(item["weather"].stringValue)
                        arr[i].append(item["classification"].stringValue)
                        arr[i].append(item["material"].stringValue)
                        arr[i].append(item["brand"].stringValue)
//                        print(arr)
                        
                        let sweater = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass:3, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "sweater"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        print(self.clothes.count)
                        self.clothes.append(sweater!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1
                    }
                    for item in json["dress"].arrayValue{
                        arr.append([])
                        print("dress")
//                        print(item)
                        arr[i].append(item["color"].stringValue)
                        arr[i].append(item["status"].stringValue)
                        arr[i].append(item["id"].stringValue)
                        arr[i].append(item["weather"].stringValue)
                        arr[i].append(item["classification"].stringValue)
                        arr[i].append(item["material"].stringValue)
                        arr[i].append(item["brand"].stringValue)
//                        print(arr)
                        
                        let dress = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass:8, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "dress"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        print(self.clothes.count)

                        self.clothes.append(dress!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1
                    }
                    for item in json["skirt"].arrayValue{
                        arr.append([])
                        print("skirt")
                        arr[i].append(item["color"].stringValue)
                        arr[i].append(item["status"].stringValue)
                        arr[i].append(item["id"].stringValue)
                        arr[i].append(item["weather"].stringValue)
                        arr[i].append(item["classification"].stringValue)
                        arr[i].append(item["material"].stringValue)
                        arr[i].append(item["brand"].stringValue)
//                        print(arr)
                        
                        let skirt = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass:7, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "skirt"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        self.clothes.append(skirt!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1

                    }
                    
                    for item in json["short sleeves"].arrayValue{
                        arr.append([])
                        print("short sleeves")
                        arr[i].append(item["color"].stringValue) //0
                        arr[i].append(item["status"].stringValue) //1
                        arr[i].append(item["id"].stringValue) //2
                        arr[i].append(item["weather"].stringValue) //3
                        arr[i].append(item["classification"].stringValue) //4
                        arr[i].append(item["material"].stringValue) //5
                        arr[i].append(item["brand"].stringValue) //6
//                        print(arr)

                        let shortSleeve = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass:1, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "shirt"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        self.clothes.append(shortSleeve!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1
                    }
                    
                    for item in json["pants"].arrayValue{
                        arr.append([])
                        print("pants")
                        arr[i].append(item["color"].stringValue)
                        arr[i].append(item["status"].stringValue)
                        arr[i].append(item["id"].stringValue)
                        arr[i].append(item["weather"].stringValue)
                        arr[i].append(item["classification"].stringValue)
                        arr[i].append(item["material"].stringValue)
                        arr[i].append(item["brand"].stringValue)
//                        print(arr)
                        
                        let pants = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass:6, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "pants"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        self.clothes.append(pants!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1

                    }

                    for item in json["jacket"].arrayValue{
                        arr.append([])
                        print("jacket")
                        arr[i].append(item["color"].stringValue)
                        arr[i].append(item["status"].stringValue)
                        arr[i].append(item["id"].stringValue)
                        arr[i].append(item["weather"].stringValue)
                        arr[i].append(item["classification"].stringValue)
                        arr[i].append(item["material"].stringValue)
                        arr[i].append(item["brand"].stringValue)
//                        print(arr)
                        
                        let jacket = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass:4, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "jacket"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        self.clothes.append(jacket!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1

                    }

                    for item in json["shorts"].arrayValue{
                        arr.append([])
                        print("shorts")
                        arr[i].append(item["color"].stringValue)
                        arr[i].append(item["status"].stringValue)
                        arr[i].append(item["id"].stringValue)
                        arr[i].append(item["weather"].stringValue)
                        arr[i].append(item["classification"].stringValue)
                        arr[i].append(item["material"].stringValue)
                        arr[i].append(item["brand"].stringValue)
//                        print(arr)
                        
                        let shorts = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass: 5, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "shorts"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        self.clothes.append(shorts!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1

                    }

                    for item in json["no sleeves"].arrayValue{
                        arr.append([])
                        print("no sleeves")
                        arr[i].append(item["color"].stringValue)
                        arr[i].append(item["status"].stringValue)
                        arr[i].append(item["id"].stringValue)
                        arr[i].append(item["weather"].stringValue)
                        arr[i].append(item["classification"].stringValue)
                        arr[i].append(item["material"].stringValue)
                        arr[i].append(item["brand"].stringValue)
//                        print(arr)
                        
                        let sleeveless = Clothing(brand:arr[i][6], classification: Int(arr[i][4])!, subclass:2, color: arr[i][0], id:Int(arr[i][2])!, material:arr[i][5], status:Int(arr[i][1])!, weather: arr[i][3], imageIcon: UIImage(named: "sleeveless"))
                        
                        let newIndexPath = IndexPath(row: self.clothes.count, section: 0)
                        self.clothes.append(sleeveless!)
                        self.tableView.insertRows(at: [newIndexPath], with: .automatic)
                        
                        i = i + 1

                    }
                    print(arr)

                }
            }
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
        idSave = clothes[indexPath.row].id


        switch clothing.classifiction {
        case 1: cell.clothClassification.text = "Top"
        case 2: cell.clothClassification.text = "Bottom"
        case 3: cell.clothClassification.text = "Dress"
        default: cell.clothClassification.text = String(clothing.classifiction)
        }
        
        switch clothing.subclass {
        case 1:
            cell.clothSubclass.text = "Short Sleeves"
            cell.clothIcon.image = UIImage(named:"shirt")
            
        case 2:
            cell.clothSubclass.text = "No sleeves"
            cell.clothIcon.image = UIImage(named:"sleeveless")
            
        case 3:
            cell.clothSubclass.text = "Sweater"
            cell.clothIcon.image = UIImage(named: "sweater")
            
        case 4:
            cell.clothSubclass.text = "Jacket"
            cell.clothIcon.image = UIImage(named: "jacket")
            
        case 5:
            cell.clothSubclass.text = "Shorts"
            cell.clothIcon.image = UIImage(named: "shorts")
            
        case 6:
            cell.clothSubclass.text = "Pants"
            cell.clothIcon.image = UIImage(named: "pants")
            
        case 7:
            cell.clothSubclass.text = "Skirt"
            cell.clothIcon.image = UIImage(named: "skirt")
            
        case 8:
            cell.clothSubclass.text = "Dress"
            cell.clothIcon.image = UIImage(named: "dress")
            
        default:
            cell.clothSubclass.text = String(clothing.subclass)
            cell.clothIcon.image = UIImage(named: "defaultPhoto")
        }
        
        switch clothing.status {
        case 1: cell.clothStatus.text = "Outside the closet"
        case 2: cell.clothStatus.text = "Inside the closet"
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
            print("Removing garment")
            
            idSave = clothes[indexPath.row].id
            
            //PUT DELETING FUNCTION IN HERE
            let parameters: [String: Any] = [ //This is the JSON we'll be passing over.
                "id" : clothes[indexPath.row].id
            ]
            
            Alamofire.request("https://damitan-mo-ko.herokuapp.com/delete", method: .delete, parameters: parameters, encoding: JSONEncoding.default)
                .responseJSON { response in
//                    print(response) //It responds with the ID of the clothing item in question.
            }
            
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
                print("hello")
                
                //UPDATE GOES IN HERE
                
                print(idSave)
                
                let parameters: [String: Any] = [ //This is the JSON we'll be passing over.
                    "id" : idSave
                ]
                
                Alamofire.request("https://damitan-mo-ko.herokuapp.com/delete", method: .delete, parameters: parameters, encoding: JSONEncoding.default)
                    .responseJSON { response in
                        //                    print(response) //It responds with the ID of the clothing item in question.
                }
                
                //DELETE THEN IT GOES TO ADD! Try to find a way to delete first and then it'll go to the prepare, where it'll add the new instance. It'll add one to the id though.
                
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
        
        guard let dress = Clothing(brand: "Cotton On", classification: 3, subclass: 8, color: "Blue", id: 21653, material: "Material1", status: 1, weather: "0,0,1,1", imageIcon: photo1) else {
            fatalError("Unable to instantiate dress")
        }
        
        guard let jacket = Clothing(brand: "Uniqlo", classification: 1, subclass: 4, color: "Blue", id: 12644, material: "Material1", status: 2, weather: "0,0,1,1", imageIcon: photo2) else {
            fatalError("Unable to instantiate jacket")
        }
        
        guard let sleeveless = Clothing(brand: "Ukay", classification: 1, subclass: 2, color: "Blue", id: 34663, material: "Material1", status: 1, weather: "0,0,1,1", imageIcon: photo3) else {
            fatalError("Unable to instantiate sleeveless")
        }
        
        guard let pants = Clothing(brand: "H&M", classification: 2, subclass: 6, color: "Blue", id: 23474, material: "Material1", status: 2, weather: "0,0,1,1", imageIcon: photo4) else {
            fatalError("Unable to instantiate pants")
        }
        
        guard let shirt = Clothing(brand: "Zara", classification: 1, subclass: 1, color: "Blue", id: 90485, material: "Material1", status: 1, weather: "0,0,1,1", imageIcon: UIImage(named: "shirt2")) else {
                fatalError("Unable to instantiate shirt")
        }
        
        clothes += [dress, jacket, sleeveless, pants, shirt]
    }
    
    
}
