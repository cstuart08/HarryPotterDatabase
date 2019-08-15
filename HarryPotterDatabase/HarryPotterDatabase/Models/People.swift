//
//  People.swift
//  HarryPotterDatabase
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

struct People: Codable {
    let id: String?
    let name: String
    let role: String?
    let house: String?
    let school: String?
    let ministryOfMagic: Bool?
    let orderOfThePheonix: Bool?
    let dumbledoresArmy: Bool?
    let deathEater: Bool?
    let bloodStatus: String?
    let species: String?
}
