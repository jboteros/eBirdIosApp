//
//  CatalogTableViewCell.swift
//  eBirdApp
//
//  Created by Johnatan Botero on 10/28/17.
//  Copyright © 2017 Johnatan Botero. All rights reserved.
//

import UIKit

class CatalogTableViewCell: UITableViewCell {
    
    @IBOutlet weak var birdsContainer: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblNameScientific: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    
    override func awakeFromNib() {
        circleImg(birdsContainer)
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func LoadData(i: Int){
        birdsContainer.imageFromServerURL(urlString: AppController.birdsContainer[i]["image"] as! String)
        lblName.text = AppController.birdsContainer[i]["name"] as? String
        lblNameScientific.text = AppController.birdsContainer[i]["nameScientific"] as? String
        lblCountry.text =  ("\(String(describing: AppController.birdsContainer[i]["country"]! as! String))-\(String(describing: AppController.birdsContainer[i]["zone"]! as! String))")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }}
