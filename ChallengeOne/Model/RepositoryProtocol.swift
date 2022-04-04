//
//  RepositoryProtocol.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

public protocol RepositoryProtocol {
    func fetchData(completion: @escaping ([String]) ->
                   Void)
}
