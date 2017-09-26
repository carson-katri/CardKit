//
//  ViewController.swift
//  CardKit
//
//  Created by Carson Katri on 9/25/17.
//  Copyright © 2017 Carson Katri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        card.tapped = {
            self.performSegue(withIdentifier: "showCard", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

