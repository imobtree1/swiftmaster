//
//  APIManager.swift
//  demo
//
//  Created by Imobtree Solutions on 3/16/18.
//  Copyright © 2018 Imobtree Solutions. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftSpinner




class APIManager {
    
    static let sharedInstance = APIManager()
    private init () {
        
    }
    
    func getUserData(onCompletion:@escaping (JSON)-> Void) {
        SwiftSpinner.show("Connecting to ...")
        Alamofire.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
            SwiftSpinner.hide()
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                let response = JSON(data)
                onCompletion(response)
            } else {
                onCompletion(nil)
            }
        }
    }
    
    
}
