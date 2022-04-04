//
//  CatService.swift
//  ChallengeOne
//
//  Created by Anderson Ortiz Dias Junior on 04/04/22.
//

import UIKit

class CatService: NSObject {
    static func makeRequest(completion: @escaping ([String]) ->
                            Void) {
        var breeds: [String] = []
        let headers = ["x-api-key": "da0e98eb-5567-40f0-8858-28e328a63b30"]
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.thecatapi.com/v1/breeds")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No error data avaliable")} else {
                    if let data = data {
                        print("abriu data")
                        do {
                            if let convertedJsonIntoDict = try
                                JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                                as? [NSDictionary] {
                                print(response ?? "no response data avaliable")
                                for breed in convertedJsonIntoDict {
                                    for attribute in breed {
                                        let keyName = String(describing: attribute.key)
                                        let keyValue = String(describing: attribute.value)
                                        if keyName == "name" {
                                            breeds.append(keyValue)
                                        }
                                    }
                                }
                                completion(breeds)
                            }
                        } catch let error as NSError {
                            print(error.localizedDescription)
                            print("exception")
                        }}
                }
        }
        dataTask.resume()
    }
}
