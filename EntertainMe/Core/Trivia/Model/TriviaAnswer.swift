//
//  TriviaAnswer.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/31/24.
//

import Foundation

struct TriviaAnswer: Identifiable {
    let id: String = UUID().uuidString
    let content: String
    let correctAnswer: Bool
}
