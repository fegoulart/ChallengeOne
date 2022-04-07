//
//  Repository.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

import Foundation
import UIKit

public final class LocalRepository: RepositoryProtocol {
    public func fetchData(completion: @escaping ([Breed]) ->
                          Void) {
        CatService.makeRequest { breeds in
            completion(breeds)
            print("breed list")
            for breed in breeds {
                print(breed.name)
            }
        }
    }
}
