//
//  AppController.swift
//  eBirdApp
//
//  Created by Johnatan Botero on 10/27/17.
//  Copyright © 2017 Johnatan Botero. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AppController{
    
    static var birdsContainer = [[String:AnyObject]]()	
    static var selectedItemInArray = 0
    static var selectedItem: String = ""
    
    func methodGet(id: String){
        //print("ApiCall")

        let apiMethod = "http://ec2-54-221-31-40.compute-1.amazonaws.com:8080/api/birds/\(id)"
        
        let head: HTTPHeaders = ["Content-Type": "application/json"]
        
        Alamofire.request(apiMethod, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: head)
            .responseJSON { response in
                //print(response.request as Any)
                //print(response.response as Any)
                //print(response.result.value as Any!)
                
                // result of response serialization
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("200 GET")
                        
                        if let resData = swiftyJsonVar.arrayObject {
                            AppController.birdsContainer = resData as! [[String:AnyObject]]
                            //                            print ("birdsContainer: \(AppController.birdsContainer)")
                        }
                    case 500:
                        print("500 GET")
                        
                    default:
                        break
                    }
                }
        }
    }
    
    static var paramPut: [String: Any] = [:]
    
    func methodPut(id: String){
        
        let apiMethod = "http://ec2-54-221-31-40.compute-1.amazonaws.com:8080/api/birds/\(id)"
        
        let head: HTTPHeaders = ["Content-Type": "application/json"]
        
        Alamofire.request(apiMethod, method: .put, parameters: AppController.paramPut, encoding: JSONEncoding.default, headers: head)
            .responseJSON { response in
                //print(response.request as Any)
                //print(response.response as Any)
                //print("\n\(response.result.value as Any!)\n")
                //result of response serialization
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("200 PUT")
                        
                    case 500:
                        print("500 PUT")
                    default:
                        break
                    }
                }
        }
    }
    
    static var paramPost: [String: Any] = [:]
    
    func methodPost(){
        
        let apiMethod = "http://ec2-54-221-31-40.compute-1.amazonaws.com:8080/api/birds/"
        
        let head: HTTPHeaders = ["Content-Type": "application/json"]
        
        Alamofire.request(apiMethod, method: .post, parameters: AppController.paramPost, encoding: JSONEncoding.default, headers: head)
            .responseJSON { response in
                //print(response.request as Any)
                //print(response.response as Any)
                //print("\n\(response.result.value as Any!)\n")
                //result of response serialization
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("200 PUT")
                        
                    case 500:
                        print("500 PUT")
                    default:
                        break
                    }
                }
        }
    }
    
    func methodDelete(id: String){
        
        let apiMethod = "http://ec2-54-221-31-40.compute-1.amazonaws.com:8080/api/birds/\(id)"
        
        let head: HTTPHeaders = ["Content-Type": "application/json"]
        
        Alamofire.request(apiMethod, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: head)
            .responseJSON { response in
                //print(response.request as Any)
                //print(response.response as Any)
                //print("\n\(response.result.value as Any!)\n")
                //result of response serialization
                
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("200 Delete")
                        
                    case 500:
                        print("500 Delete")
                    default:
                        break
                    }
                }
        }
    }
}
