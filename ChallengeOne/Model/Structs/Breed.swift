//
//  Breed.swift
//  ChallengeOne
//
//  Created by Anderson Ortiz Dias Junior on 04/04/22.
//

import UIKit

public struct Breed{
    var id: String
    var name: String
    var temperament: String
    var lifeSpan: String
    var catDescription: String
    var image: BreedImageDTO
    init(id: String, name: String, temperament: String, lifeSpan: String, description:String, image: BreedImageDTO) {
        self.id = id
        self.name = name
        self.temperament = temperament
        self.lifeSpan = lifeSpan
        self.catDescription = description
        self.image = image
    }
}

