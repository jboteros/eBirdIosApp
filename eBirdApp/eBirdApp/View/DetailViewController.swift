//
//  DetailViewController.swift
//  eBirdApp
//
//  Created by Johnatan Botero on 10/29/17.
//  Copyright © 2017 Johnatan Botero. All rights reserved.
//

import UIKit
import Foundation
class DetailViewController: UIViewController {
    
    @IBOutlet weak var viewBtnCenter: UIView!
    @IBOutlet weak var viewSubBtnContainer: UIView!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var menuContainer: UIView!
    @IBOutlet weak var menuEdit: UIView!
    @IBOutlet weak var viewMenuEdit: UIView!
    
    @IBOutlet weak var imgHeader: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblScientificName: UILabel!
    @IBOutlet weak var lblFamily: UILabel!
    @IBOutlet weak var lblSubFamily: UILabel!
    @IBOutlet weak var lblRegions: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfScientificName:UITextField!
    @IBOutlet weak var tfFamily: UITextField!
    @IBOutlet weak var tfSubFamily: UITextField!
    @IBOutlet weak var tfRegions: UITextField!
    
    @IBOutlet weak var bgBtnBack: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    var isEditorMode: Bool = false
    var isMenuActive:Bool = false
    let animationTime = 0.15
    
    override func viewDidLoad() {
        circle(anything: viewBtnCenter)
        circle(anything: viewSubBtnContainer)
        circle(anything: bgBtnBack)
        circle(anything: menuEdit)
        circle(anything: viewMenuEdit)
        
        menuEdit.alpha = 1
        menuContainer.alpha = 1
        
        btnMenu.imageView?.contentMode = .scaleAspectFit
        btnBack.imageView?.contentMode = .scaleAspectFit
        
        btnEdit.imageView?.contentMode = .scaleAspectFit
        btnShare.imageView?.contentMode = .scaleAspectFit
        btnLike.imageView?.contentMode = .scaleAspectFit
        btnDelete.imageView?.contentMode = .scaleAspectFit
        
        
        btnLike.imageView?.contentMode = .scaleAspectFit
        btnCancel.imageView?.contentMode = .scaleAspectFit
        
        super.viewDidLoad()
        
        menuEdit.isHidden = true
        
        EditorAction(b: false)
        
        self.viewSubBtnContainer.transform = CGAffineTransform.identity.scaledBy(x: 0.3 , y: 0.3)
        // Do any additional setup after loading the view.
        LoadData()
    }
    
    
    
    func LoadData(){
        imgHeader.imageFromServerURL(urlString: AppController.birdsContainer[AppController.selectedItemInArray]["image"] as! String)
        lblName.text = (AppController.birdsContainer[AppController.selectedItemInArray]["name"] as? String)
        lblScientificName.text = (AppController.birdsContainer[AppController.selectedItemInArray]["nameScientific"] as! String)
        lblFamily.text = (AppController.birdsContainer[AppController.selectedItemInArray]["family"] as! String)
        lblSubFamily.text = (AppController.birdsContainer[AppController.selectedItemInArray]["subFamily"] as! String)
        lblRegions.text = ("\((AppController.birdsContainer[AppController.selectedItemInArray]["country"] as! String)) - \((AppController.birdsContainer[AppController.selectedItemInArray]["zone"] as! String))")
        lblDescription.text = (AppController.birdsContainer[AppController.selectedItemInArray]["description"] as! String)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnMenuAction(_ sender: Any) {
        if isMenuActive==false{
            
            UIView.animate(withDuration: animationTime, animations: {
                self.viewSubBtnContainer.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            }, completion: { (finish) in
                self.isMenuActive=true
            })
            
        }else{
            
            UIView.animate(withDuration: animationTime, animations: {
                self.viewSubBtnContainer.transform = CGAffineTransform.identity.scaledBy(x: 0.3, y: 0.3)
            }, completion: { (finish) in
                self.isMenuActive=false
            })
        }
    }
    
    @IBAction func btnArrowBackAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnEditorAction(_ sender: Any) {
        if isEditorMode==true{
            EditorAction(b: false)
            menuEdit.isHidden = true
            menuEdit.isUserInteractionEnabled = false
            isEditorMode=false
            self.menuEdit.transform = CGAffineTransform.identity.scaledBy(x: 0.0, y: 0.0)
        }else{
            EditorAction(b: true)
            menuEdit.isHidden = false
            menuEdit.isUserInteractionEnabled = true
            isEditorMode=true
            self.menuEdit.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
        }
    }
    
    func EditorAction(b:Bool){
        if b != true{
            
            tfName.isHidden = true
            tfScientificName.isHidden = true
            tfFamily.isHidden = true
            tfSubFamily.isHidden = true
            tfRegions.isHidden = true
            
            lblName.isHidden = false
            lblScientificName.isHidden = false
            lblFamily.isHidden = false
            lblSubFamily.isHidden = false
            lblRegions.isHidden = false
            
            lblDescription.isEditable = false
            lblDescription.isSelectable = false
        }else{
            
            tfName.text = (AppController.birdsContainer[AppController.selectedItemInArray]["name"] as? String)
            tfScientificName.text = (AppController.birdsContainer[AppController.selectedItemInArray]["nameScientific"] as! String)
            tfFamily.text = (AppController.birdsContainer[AppController.selectedItemInArray]["family"] as! String)
            tfSubFamily.text = (AppController.birdsContainer[AppController.selectedItemInArray]["subFamily"] as! String)
            tfRegions.text = ("\((AppController.birdsContainer[AppController.selectedItemInArray]["country"] as! String)) - \((AppController.birdsContainer[AppController.selectedItemInArray]["zone"] as! String))")
            
            tfName.isHidden = false
            tfScientificName.isHidden = false
            tfFamily.isHidden = false
            tfSubFamily.isHidden = false
            tfRegions.isHidden = false
            
            lblName.isHidden = true
            lblScientificName.isHidden = true
            lblFamily.isHidden = true
            lblSubFamily.isHidden = true
            lblRegions.isHidden = true
            
            lblDescription.isEditable = true
            lblDescription.isSelectable = true
        }
    }
    
    
    @IBAction func btnEditModeSaveAction(_ sender: Any) {
        
        let Region: String = tfRegions.text!
        var SplitRegions = Region.components(separatedBy: " - ")
        
        AppController.paramPut = [
            "name": tfName.text!,
            "nameScientific": tfScientificName.text!,
            "family": tfFamily.text!,
            "subFamily": tfSubFamily.text!,
            "country": SplitRegions[0],
            "zone": SplitRegions[1],
            "description": lblDescription.text!,
            "image": (AppController.birdsContainer[AppController.selectedItemInArray]["image"] as! String)
            
            ] as [String : Any]
        
        //print (AppController.paramPut)
        AppController().methodPut(id: AppController.selectedItem)
        
        lblName.text = tfName.text
        lblScientificName.text = tfScientificName.text
        lblFamily.text = tfFamily.text
        lblSubFamily.text = tfSubFamily.text
        lblRegions.text = tfRegions.text
        
        menuEdit.isHidden = true
    }
    
    @IBAction func btnCancelEditModeAction(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Save", message: "You want to exit without saving", preferredStyle:UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Exit", style: UIAlertActionStyle.default)
        { action -> Void in
            
            self.EditorAction(b: false)
            self.menuEdit.isHidden = true
            self.isEditorMode=false
            
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        { action -> Void in
            
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    @IBAction func btnDeleteAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Delete", message: "you want to delete this record, you can not retrieve the information", preferredStyle:UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Delete", style: UIAlertActionStyle.default)
        { action -> Void in
            AppController().methodDelete(id: AppController.selectedItem)
            
            AppController().methodGet(id: "")
            self.dismisSegue()
            
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        { action -> Void in
            
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    func dismisSegue(){
        AppController.birdsContainer.removeAll()
        performSegue(withIdentifier: "goToHome", sender: nil)
        // dismiss(animated: true, completion: nil)
    }
    
}




