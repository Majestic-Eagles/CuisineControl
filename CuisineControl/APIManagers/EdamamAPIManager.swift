//
//  EdamamAPIManager.swift
//  CuisineControl
//
//  Created by Taylor McLaughlin on 10/24/18.
//  Copyright © 2018 Taylor McLaughlin. All rights reserved.
//

import Foundation

class EdamamAPIManager {
    
    let applicationID = "700a667e"
    let applicationKey = "12c0086d319c5d974cfc2a3182e14058"
    let baseURLString = "https://api.edamam.com/"
    let testString = "search?q=chicken&app_id=832f958b&app_key=e8cf23abb1138f67a8fcee3299fb2f56"
    var session: URLSession
    static var shared: EdamamAPIManager = EdamamAPIManager()
    
    init() {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    }
    
    func getData() {
        
        
        if let url = URL(string: baseURLString + testString) {
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    let dictionary = try! JSONSerialization.jsonObject(with: data, options: [])
                    print(dictionary)
                } else {
                    print(error?.localizedDescription)
                }
            }
            task.resume()
        }
        
        
    }
    
    
}
