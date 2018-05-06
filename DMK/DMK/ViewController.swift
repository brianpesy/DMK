//
//  ViewController.swift
//  DMK
//
//  Created by Group 4 on 30/04/2018.
//  Copyright © 2018 dmk. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet var tblJSON: UITableView!
    var arrRes = [[String:AnyObject]]() //Array of dictionary
    
    func getAPI(){
        Alamofire.request("https://guarded-falls-36394.herokuapp.com/mobileget").responseJSON { (responseData) -> Void in //Like our get request
            if((responseData.result.value) != nil) {
                let json = JSON(responseData.result.value!)
                print(json)
                
                if (json["status"].stringValue == "success"){
                    //Do the code here.
                    for item in json["message"].arrayValue {
                        print(item)
                        print(item["1"]["brand"].stringValue) //Works for nested now. Why did it not work: it lacks []. Presence of [] means array. Otherwise, use stringValue.
                        print(item["1"]["status"].intValue)
                    }
                    
                }
                
                if let resData = json["message"].arrayObject { //We can use this in order to get the data from the server.
                    self.arrRes = resData as! [[String:AnyObject]] //Puts all the data into an array
                    //                    print(resData)
                }
                print(self.arrRes[0]) //The data is in an array that we can individually access now.
                if self.arrRes.count > 0 {
                    //   self.tblJSON.reloadData() //error here? Unexpectedly found nil.
                }
            }
        }
    }
    
    override func viewDidLoad() {
        //As the app loads, it does these.
        super.viewDidLoad()
        // This is a test website for get requests. ( http://httpbin.org/get )
        // https://api.androidhive.info/contacts/
        // https://guarded-falls-36394.herokuapp.com/mobileget
        
        getAPI()
        
     //   /*POST request sample
        let parameters: [String: Any] = [ //This is the JSON we'll be passing over.
            "IdQuiz" : 102,
            "IdUser" : "iosclient",
            "User" : "iosclient",
            "List": [
                [
                    "IdQuestion" : 5,
                    "IdProposition": 2,
                    "Time" : 32
                ],
                [
                    "IdQuestion" : 4,
                    "IdProposition": 3,
                    "Time" : 9
                ]
            ]
        ]
        
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
//                print(response) //The response of the post. Posting the parameters. I just can't access the website and change anything. We have sent this!
        }

     //    */
        
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
