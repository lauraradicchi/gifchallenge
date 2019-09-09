//
//  CatDescriptionViewController.swift
//  GifChallenge
//
//  Created by Laura Radicchi on 08/09/19.
//  Copyright © 2019 com.LauraRadicchi. All rights reserved.
//

import UIKit

class CatDescriptionViewController: UIViewController {
    var catUrl = String()
    @IBOutlet weak var label:UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        label.text = catUrl
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func close(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
   
    }
}
