//
//  DadJoke.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/23/24.
//

import Foundation

/// `DadJoke`
/// Model generated based on the `😃 icanhazdadjoke` (`https://icanhazdadjoke.com/api`)
struct DadJoke: Codable, Identifiable {
    let id: String
    let joke: String
}
