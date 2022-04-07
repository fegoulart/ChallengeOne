//
//  CatService.swift
//  ChallengeOne
//
//  Created by Anderson Ortiz Dias Junior on 04/04/22.
//

import UIKit
//MARK: - Creating request
class CatService: NSObject {
    static func makeRequest(completion: @escaping ([Breed]) ->
                            Void) {
        let headers = ["x-api-key": "da0e98eb-5567-40f0-8858-28e328a63b30"]
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.thecatapi.com/v1/breeds")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
//MARK: - Getting response
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No error data avaliable")} else {
                    if let data = data {
                        print("abriu data")
                        let decoder = JSONDecoder()
                        guard let breeds = try? decoder.decode([BreedDTO].self, from: data) else {return}
                        let myBreeds: [Breed] = breeds.compactMap{
                            Breed(id: $0.id ?? "", name: $0.name ?? "", temperament: $0.temperament ?? "", lifeSpan: $0.life_span ?? "", description: $0.description ?? "", image: $0.image ?? BreedImageDTO())
                            }
                        completion(myBreeds)
                    }
                }
        }
        dataTask.resume()
    }
}
