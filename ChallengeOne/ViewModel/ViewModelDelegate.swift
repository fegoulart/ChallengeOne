//
//  ViewModelDelegate.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

public protocol ViewModelDelegate: AnyObject {
    func dataReceived(_ catBreeds: [String])
}
