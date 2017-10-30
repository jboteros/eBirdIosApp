//
//  ViewController.swift
//  eBirdApp
//
//  Created by Johnatan Botero on 10/27/17.
//  Copyright © 2017 Johnatan Botero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnFind: UIButton!
    @IBOutlet weak var btnCatalog: UIButton!
    

    
    override func viewDidLoad() {
        
        btnCatalog.imageView?.contentMode = .scaleAspectFit
        btnAdd.imageView?.contentMode = .scaleAspectFit
        btnFind.imageView?.contentMode = .scaleAspectFit
        
        super.viewDidLoad()
        AppController().methodGet(id: "")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnCatalogAction(_ sender: Any) {
        performSegue(withIdentifier: "showCatalog", sender: nil)
    }
    

    @IBAction func btnBackAction(_ sender: Any) {
    }
}
