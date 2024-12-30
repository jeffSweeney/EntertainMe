//
//  DadJokeViewModel.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

final class DadJokeViewModel: ObservableObject {
    @Published var dadJoke: DadJoke?
    @Published var isLoading: Bool
    @Published var errorMessage: String?
    
    init(dadJoke: DadJoke? = nil, isLoading: Bool = false, errorMessage: String? = nil) {
        self.dadJoke = dadJoke
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    @MainActor
    func fetchJoke() async {
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
}
