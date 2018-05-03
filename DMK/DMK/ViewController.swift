//
//  ViewController.swift
//  DMK
//
//  Created by Brian Sy on 30/04/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    override func viewDidLoad() {
        //As the app loads, it does these.
        super.viewDidLoad()
        print("hi\n")
        Alamofire.request("https://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in //Like our get request
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                print("yeet")
                
                for item in swiftyJsonVar["contacts"].arrayValue { //Works for all the names in the json file.
                    print(item["name"].stringValue)
                }
                
                if let resData = swiftyJsonVar["contacts"].arrayObject { //We can use this in order to get the data from the server.
                    self.arrRes = resData as! [[String:AnyObject]] //Puts all the data into an array
//                    print("in")
//                    print(resData)
                }
//                print(self.arrRes.count)
//                print(self.arrRes[0]) //The data is in an array that we can individually access now.
                if self.arrRes.count > 0 {
                 //   self.tblJSON.reloadData() //error here? Unexpectedly found nil.
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
