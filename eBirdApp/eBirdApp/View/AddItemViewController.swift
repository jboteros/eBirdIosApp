//
//  AddItemViewController.swift
//  eBirdApp
//
//  Created by Johnatan Botero on 10/29/17.
//  Copyright © 2017 Johnatan Botero. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfScientificName:UITextField!
    @IBOutlet weak var tfFamily: UITextField!
    @IBOutlet weak var tfSubFamily: UITextField!
    @IBOutlet weak var tfRegions: UITextField!
    
    @IBOutlet weak var lblDescription: UITextView!
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var bgBtnBack: UIView!
    
    @IBOutlet weak var menuEdit: UIView!
    @IBOutlet weak var viewMenuEdit: UIView!
    
    @IBOutlet weak var btnAcept: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnCentral: UIButton!
    
    override func viewDidLoad() {
        
        circle(anything: menuEdit)
        circle(anything: viewMenuEdit)
        circle(anything: bgBtnBack)
        
        btnBack.imageView?.contentMode = .scaleAspectFit
        btnAcept.imageView?.contentMode = .scaleAspectFit
        btnCancel.imageView?.contentMode = .scaleAspectFit
        btnCentral.imageView?.contentMode = .scaleAspectFit
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSaveItemAction(_ sender: Any) {
        
        let Region: String = tfRegions.text!
        var SplitRegions = Region.components(separatedBy: " - ")
        
        AppController.paramPost = [
            "name": tfName.text!,
            "nameScientific": tfScientificName.text!,
            "family": tfFamily.text!,
            "subFamily": tfSubFamily.text!,
            "country": SplitRegions[0],
            "zone": SplitRegions[0],
            "description": lblDescription.text!,
            "image": "http://jbotero.com/developer/eBirdAPIAssets/imgDefault.jpg"
            
            ] as [String : Any]
        
        AppController().methodPost()
        AppController().methodGet(id: "")
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
