//
//  Service.swift
//  |<Orders>|
//
//  Created by RAFAEL on 3/11/19.
//  Copyright © 2019 RAFAEL. All rights reserved.
//

import Foundation

class Service{
    
    static let shared = Service()   //Singleton
   

    //Generic JSON Functions
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()){
        
        print("T is Type: ", T.self)
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            //print(String(data: data!, encoding: .utf8))
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do{
                let objects = try JSONDecoder().decode(T.self, from: data!)
                
                completion(objects, nil)
                
            } catch {
                completion(nil, err)
                print("Failed to Decode: ", err)
            }
            }.resume()
    }
    
    
    func fetchHomeHeaderItems(completion: @escaping ([HomeHeaderItems]?, Error?) -> Void) {
        let urlString = "https://api.myjson.com/bins/187wdq"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchFirstSectionItems(completion: @escaping (ItemGroup?, Error?) -> Void) {
        let urlString = "https://api.myjson.com/bins/o1o0i"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSecondSectionItems(completion: @escaping (ItemGroup?, Error?) -> Void) {
        let urlString = "https://api.myjson.com/bins/1f4ba6"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchThirdSectionItems(completion: @escaping (ItemGroup?, Error?) -> Void) {
        let urlString = "https://api.myjson.com/bins/ktcla"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchFirstMenuItems(completion: @escaping (ItemMenu?, Error?) -> Void) {
        let urlString = "https://api.myjson.com/bins/95c7y"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    func fetchSecondMenuItems(completion: @escaping (ItemMenu?, Error?) -> Void) {
        let urlString = "https://api.myjson.com/bins/1a4cvy"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
}

