//
//  ViewModel.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

import Foundation

public final class ViewModel: ViewModelProtocol {
    
    let repository: RepositoryProtocol
    weak public var delegate: ViewModelDelegate?
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    public func setDelegate(viewModelDelgate delegate: ViewModelDelegate) {
        self.delegate = delegate
    }
    
    public func getData() {
        repository.fetchData { (breeds) in
            self.delegate?.dataReceived(breeds)
        }
    }
}
