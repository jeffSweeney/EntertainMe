//
//  DadJokeViewModel.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

final class DadJokeViewModel: ObservableObject, @preconcurrency TabBaseViewProtocol {
    @Published var dadJoke: DadJoke?
    @Published var isLoading: Bool
    @Published var errorMessage: String?
    
    init(dadJoke: DadJoke? = nil, isLoading: Bool = false, errorMessage: String? = nil) {
        self.dadJoke = dadJoke
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    let title = "Dad Jokes"
    let systemImage = "theatermasks.fill"
    let subtitle = "Warning: Side effects may include eye-rolling and unexpected chuckles."
    let buttonText = "Get a Joke!"
    
    @MainActor
    func fetchData() async {
        resetData()
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000) // Simulate 2 second delay to show off loading screen
            dadJoke = try await NetworkService.shared.fetchDadJoke()
            errorMessage = nil
        } catch {
            errorMessage = "Dad must be mowing the lawn. No jokes available at this time. Try again later."
        }
        
        isLoading = false
    }
    
    @MainActor
    func resetData() {
        dadJoke = nil
        isLoading = false
        errorMessage = nil
    }
    
    func launchSheet() -> DadJokeView {
        return DadJokeView(viewModel: self)
    }
}
