//
//  Globals.swift
//  eBirdApp
//
//  Created by Johnatan Botero on 10/28/17.
//  Copyright © 2017 Johnatan Botero. All rights reserved.
//

import Foundation

import Foundation
import UIKit

extension UIViewController{
    

    func borderBoldGray2(button:UIButton){
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2
    }
    

    func borderRegularGray1(anything:AnyObject){
        anything.layer.borderColor = UIColor.init(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1).cgColor
        anything.layer.borderWidth = 1
    }
    
  
    func borderBoldGray2(anything:AnyObject){
        anything.layer.borderColor = UIColor.gray.cgColor
        anything.layer.borderWidth = 2
    }
 
    func kikBorder(button:UIButton){
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 0
    }
    
   
    func kikBorder2(button:AnyObject){
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 0
    }
    
  
    func cornerRadius20(button:UIButton){
        button.layer.cornerRadius = 20
    }
    
    func cornerRadiusX(button:UIButton, i: CGFloat){
        button.layer.cornerRadius = i
    }
    
  
    func cornerRadius20(any:AnyObject){
        any.layer.cornerRadius = 20
    }
    
    func cornerRadiusX(any:AnyObject, i:CGFloat){
        any.layer.cornerRadius = i
    }
    
    /*
     esta funcion lo que hace es que un AnyObject lo convierte en forma circular , es decir, lo muestra en forma circular , sirve para las fotos de perfil
     */
    func circle(anything:AnyObject){
        anything.layer.cornerRadius = anything.frame.size.width / 2
    }
    
    /*
     esta funcion lo que hace es que un UIImageView lo convierte en forma circular , es decir, lo muestra en forma circular , sirve para las fotos de perfil
     */
    func circleImg(_ image:UIImageView) {
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }

    func goToAnyViewController(controllerID:String){
        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: controllerID) as UIViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        self.present(viewController, animated: false, completion: nil)
    }
    
    /*
     esta funcion lo que hace es averiguar el alto del dispositivo y el ancho del dispositivo
     */
    func getHeightForDevice() -> [Float] {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate,
            let window = delegate.window else {
                return [0.0,0.0]
        }
        
        let heightDevice = window.bounds.height
        let widthDevice = window.bounds.width
        
        return [Float(widthDevice), Float(heightDevice)]
    }
    
    //ALERTS
    func weWorkingSection(){
        let alert = UIAlertController(title: "Acción no disponible", message: "Estamos trabajando en esta sección para que quede perfecta , por ahora no se encuentra disponible", preferredStyle: .alert)
        let action = UIAlertAction(title: "Aceptar", style: .destructive, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UIImageView{
    
    //Ambas son blur effect , la diferencia son los parametros
    func blurEffect(image:UIImageView){
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = image.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        image.addSubview(blurEffectView)
    }
    
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}

extension UIView{
    
    //variable estatica que almacena el color de orux
    static let yellowButtonOrux = UIColor.init(red: 254/255.0, green: 251/255.0, blue: 124/255.0, alpha: 1)
    
    /*
     estas descripciones son las mismas que se hizo en UIViewController pero estas son para UIView
     */
    func borderBoldGray2(button:UIButton){
        button.layer.borderColor = UIColor.init(red: 44.0/255.0, green: 43.0/355.0, blue: 43.0/255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
    }
    
    func borderBoldGray2View(button:UIView){
        button.layer.borderColor = UIColor.init(red: 44.0/255.0, green: 43.0/355.0, blue: 43.0/255.0, alpha: 1).cgColor
        button.layer.borderWidth = 1
    }
    
    func borderBoldGray22(button:UIButton){
        button.layer.borderColor = UIColor.init(red: 229.0/255.0, green: 229.0/255.0, blue: 229.0/255.0, alpha: 1).cgColor
        button.layer.borderWidth = 2
    }
    
    func cornerRadius20(button:UIButton){
        button.layer.cornerRadius = 20
    }
    
    func kikBorder(button:UIButton){
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 0
    }
    
    func circle(anything:AnyObject){
        anything.layer.cornerRadius = anything.frame.size.width / 2
    }
    
    func circleImg(_ image:UIImageView) {
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    
}


extension String {
    mutating func insert(separator: String, every n: Int) {
        self = inserting(separator: separator, every: n)
    }
    func inserting(separator: String, every n: Int) -> String {
        var result: String = ""
        let characters = Array(self.characters)
        stride(from: 0, to: characters.count, by: n).forEach {
            result += String(characters[$0..<min($0+n, characters.count)])
            if $0+n < characters.count {
                result += separator
            }
        }
        return result
    }
    
    
}

extension UIImageView {
    public func imageFromServerURL(urlString: String, defaultImage : String?) {
        if let di = defaultImage {
            self.image = UIImage(named: di)
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
                //print ("catchedIMG \(urlString)")
            })
            
        }).resume()
    }
}



extension UILabel {
    func adjustFontSizeToFit(minimumFontSize: CGFloat, maximumFontSize: CGFloat? = nil) {
        let maxFontSize = maximumFontSize ?? font.pointSize
        for size in stride(from: maxFontSize, to: minimumFontSize, by: -CGFloat(0.1)) {
            let proposedFont = font.withSize(size)
            let constraintSize = CGSize(width: bounds.size.width, height: CGFloat(MAXFLOAT))
            let labelSize = ((text ?? "") as NSString).boundingRect(with: constraintSize,
                                                                    options: .usesLineFragmentOrigin,
                                                                    attributes: [NSAttributedStringKey.font: proposedFont],
                                                                    context: nil)
            if labelSize.height <= bounds.size.height {
                font = proposedFont
                setNeedsLayout()
                break;
            }
        }
    }
}

import SystemConfiguration


protocol Utilities {
}

extension NSObject:Utilities{
    
    
    enum ReachabilityStatus {
        case notReachable
        case reachableViaWWAN
        case reachableViaWiFi
    }
    
    var currentReachabilityStatus: ReachabilityStatus {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return .notReachable
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return .notReachable
        }
        
        if flags.contains(.reachable) == false {
            // The target host is not reachable.
            return .notReachable
        }
        else if flags.contains(.isWWAN) == true {
            // WWAN connections are OK if the calling application is using the CFNetwork APIs.
            return .reachableViaWWAN
        }
        else if flags.contains(.connectionRequired) == false {
            // If the target host is reachable and no connection is required then we'll assume that you're on Wi-Fi...
            return .reachableViaWiFi
        }
        else if (flags.contains(.connectionOnDemand) == true || flags.contains(.connectionOnTraffic) == true) && flags.contains(.interventionRequired) == false {
            // The connection is on-demand (or on-traffic) if the calling application is using the CFSocketStream or higher APIs and no [user] intervention is needed
            return .reachableViaWiFi
        }
        else {
            return .notReachable
        }
    }
    
}
