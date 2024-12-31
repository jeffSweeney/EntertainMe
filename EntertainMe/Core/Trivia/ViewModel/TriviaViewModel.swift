//
//  TriviaViewModel.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

final class TriviaViewModel: ObservableObject, @preconcurrency TabBaseViewProtocol {
    @Published var triviaQuestion: String?
    @Published var triviaAnswers: [TriviaAnswer]?
    @Published var isLoading: Bool
    @Published var errorMessage: String?
    
    init(triviaQuestion: String? = nil, triviaAnswers: [TriviaAnswer]? = nil, isLoading: Bool = false, errorMessage: String? = nil) {
        self.triviaQuestion = triviaQuestion
        self.triviaAnswers = triviaAnswers
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    let title = "Trivia"
    let systemImage = "brain.head.profile"
    let subtitle = "Challenge yourself with questions that'll make you think twice."
    let buttonText = "Play Trivia!"
    
    @MainActor
    func fetchData() async {
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000) // Simulate 2 second delay to show off loading screen
            
            let trivia = try await NetworkService.shared.fetchTrivia()
            var answers = [TriviaAnswer(content: trivia.correctAnswer, correctAnswer: true)]
            answers.append(contentsOf: trivia.incorrectAnswers.map {TriviaAnswer(content: $0,
                                                                                 correctAnswer: false)})
            
            // TODO: Refactor this to be part of same object rather than 2 independent publishers.
            triviaQuestion = trivia.question
            triviaAnswers = answers.shuffled()
            errorMessage = nil
        } catch {
            errorMessage = "Trivia: Who tried to fetch trivia data and failed? This guy! Try again later."
        }
        
        isLoading = false
    }
    
    @MainActor
    func resetData() {
        triviaAnswers = nil
        isLoading = false
        errorMessage = nil
    }
    
    func launchSheet() -> some View {
        return TriviaView(viewModel: self)
    }
}
