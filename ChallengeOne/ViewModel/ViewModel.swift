//
//  ViewModel.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

public final class ViewModel: ViewModelProtocol {

    let repository: RepositoryProtocol
    weak public var delegate: ViewModelDelegate?

    init(repository: RepositoryProtocol) {
        self.repository = repository
    }

    public func getData() {
        let data = repository.fetchData()
        delegate?.dataReceived(data)
    }
}
