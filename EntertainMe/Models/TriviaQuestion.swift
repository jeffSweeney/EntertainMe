//
//  TriviaQuestion.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/23/24.
//

import Foundation

/// `TriviaQuestion`
/// Model generated based on the `Open Trivia Database` (`https://opentdb.com/api_config.php`)
struct TriviaQuestion: Codable, Identifiable {
    var id: String = UUID().uuidString
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey {
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

extension TriviaQuestion: Equatable {
    static func from(response data: Data) throws -> TriviaQuestion {
        let decoder = JSONDecoder()
        let rawResponse = try decoder.decode(TriviaResponse.self, from: data)
        
        guard let firstQuestion = rawResponse.results.first else {
            // TODO: Update this error later
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "No trivia results found"))
        }
        
        return firstQuestion
    }
}

private struct TriviaResponse: Codable {
    let results: [TriviaQuestion]
}
