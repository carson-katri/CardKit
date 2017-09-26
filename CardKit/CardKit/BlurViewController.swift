//
//  BlurViewController.swift
//  CardKit
//
//  Created by Carson Katri on 9/25/17.
//  Copyright © 2017 Carson Katri. All rights reserved.
//

import UIKit

class BlurViewController: UIViewController {

    @IBOutlet weak var card: CardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        card.blur = .light
        card.tapped = {
            self.dismiss(animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
