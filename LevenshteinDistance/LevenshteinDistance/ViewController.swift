//
//  ViewController.swift
//  LevenshteinDistance
//
//  Created by changcun on 30/11/2017.
//  Copyright © 2017 com.qcc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Sunday".levenshteinDistance(target: "Saturday"))
        print("Sunday".levenshteinDistance(target: "Sunday"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

