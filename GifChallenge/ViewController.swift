//
//  ViewController.swift
//  GifChallenge
//
//  Created by Laura Radicchi on 08/09/19.
//  Copyright © 2019 com.LauraRadicchi. All rights reserved.
//

import UIKit

import SwiftyJSON
import SDWebImage
import Alamofire

class ViewController: UITableViewController{
    @IBOutlet var tableview: UITableView!
    var cats = [String]()
    var url = "https://api.thecatapi.com/v1/images/search?limit=100"
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        requestCat(url: url)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = cats[indexPath.row]
        
        return cell
    }
    
    let blogSegueIdentifier = "segueCat"
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == blogSegueIdentifier,
            let destination = segue.destination as? CatDescriptionViewController,
            let catIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.catUrl = cats[catIndex]
        }
    }
    func requestCat(url:String){
        Alamofire.request(url).validate().responseJSON { (Response) -> Void in
            // checking if result has value
            if let value = Response.result.value {
    
                let json = JSON(value)
                for item in json.array! {
                    let description: String? = item["url"].stringValue
                    self.cats.append(description!)
                  
                   
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
            }
        }
    }
    
    
    }
}
