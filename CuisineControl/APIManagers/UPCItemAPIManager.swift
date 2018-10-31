//
//  UPCItemAPIManager.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/31/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class UPCItemAPIManager {
    
    let baseURLString = "https://api.upcitemdb.com/prod/trial"
    let lookupString = "/lookup?upc="
    var session: URLSession!
    static var shared: UPCItemAPIManager = UPCItemAPIManager()
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getUPC(UPC: String!) {
        
        if let url = URL(string: baseURLString + lookupString + UPC) {
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    let itemInfoArray = dictionary["items"] as! NSArray
                    let itemInfoDictionary = itemInfoArray[0] as! [String: Any]
                    print(itemInfoDictionary["title"]!)
                    EdamamAPIManager.shared.getFoodData(foodString: itemInfoDictionary["title"] as! String)
                } else {
                    print(error?.localizedDescription)
                }
            }
            task.resume()
        }
        
    }
    
}
