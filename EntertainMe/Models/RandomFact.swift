//
//  RandomFact.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/23/24.
//

import Foundation

/// `RandomFact`
/// Model generated based on the `Useless Facts` (`https://uselessfacts.jsph.pl/`)
struct RandomFact: Codable, Identifiable {
    let id: String
    let text: String
}
