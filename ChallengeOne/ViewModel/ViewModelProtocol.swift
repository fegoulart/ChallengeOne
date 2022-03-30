//
//  ViewModelProtocol.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

public protocol ViewModelProtocol {
    var delegate: ViewModelDelegate? { get set }
    func getData()
}
