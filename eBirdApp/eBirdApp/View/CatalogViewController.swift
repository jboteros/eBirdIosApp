//
//  CatalogViewController.swift
//  eBirdApp
//
//  Created by Johnatan Botero on 10/28/17.
//  Copyright © 2017 Johnatan Botero. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnArrowBack: UIButton!
    override func viewDidLoad() {
        
        btnArrowBack.imageView?.contentMode = .scaleAspectFit
        
        super.viewDidLoad()
       
        self.tableView.reloadData()

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AppController.birdsContainer.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

 
        let cell = Bundle.main.loadNibNamed("CatalogTableViewCell", owner: self, options: nil)?.first as! CatalogTableViewCell

        cell.LoadData(i: indexPath.row)
    
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 80.0
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        AppController.selectedItemInArray = indexPath.row
        AppController.selectedItem = (AppController.birdsContainer[indexPath.row]["_id"] as? String)!
       
        print("select \(AppController.selectedItem)")
        
        AppController().methodGet(id: AppController.selectedItem)

        performSegue(withIdentifier: "showDetail", sender: nil)
        
    }

    @IBAction func btnArrowBackAction(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
    
}
