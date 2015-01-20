//
//  ViewController.swift
//  MusicController
//
//  Created by Leonardo Lanzinger on 20/01/15.
//  Copyright (c) 2015 Leonardo Lanzinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var rdfParser: RdfParser = RdfParser()
        rdfParser.parseRDFXML("/Users/Leo/Documents/XCODE/MusicController/MusicController/example.xml")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

