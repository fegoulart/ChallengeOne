//
//  Repository.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
//

import Foundation

public final class LocalRepository: RepositoryProtocol {

    let breeds: [String] = [
        "Abyssinian",
        "Aegean",
        "American Bobtail",
        "American Curl",
        "American Shorthair",
        "American Wirehair",
        "Arabian Mau",
        "Australian Mist",
        "Balinese",
        "Bambino",
        "Bengal",
        "Birman",
        "Bombay",
        "British Longhair",
        "Burmese",
        "Burmilla"]

    public func fetchData() -> [String] {
        return breeds
    }

}
