//
//  TriviaViewModel.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

final class TriviaViewModel: ObservableObject, @preconcurrency TabBaseViewProtocol {
    @Published var triviaQuestion: TriviaQuestion?
    @Published var isLoading: Bool
    @Published var errorMessage: String?
    
    init(triviaQuestion: TriviaQuestion? = nil, isLoading: Bool = false, errorMessage: String? = nil) {
        self.triviaQuestion = triviaQuestion
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    let title = "Trivia"
    let systemImage = "brain.head.profile"
    let subtitle = "Challenge yourself with questions that'll make you think twice."
    let buttonText = "Play Trivia!"
    
    @MainActor
    func fetchData() async {
        print("DEBUG: Fetching data ...")
    }
    
    @MainActor
    func resetData() {
        triviaQuestion = nil
        isLoading = false
        errorMessage = nil
    }
    
    func launchSheet() -> some View {
        Text("TODO: Implement Trivia")
    }
}
