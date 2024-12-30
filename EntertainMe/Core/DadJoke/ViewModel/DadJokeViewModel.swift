//
//  DadJokeViewModel.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

final class DadJokeViewModel: ObservableObject {
    @Published var joke: DadJoke? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    @MainActor
    func fetchJoke() async {
        isLoading = true
        
        do {
            joke = try await NetworkService.shared.fetchDadJoke()
        } catch {
            errorMessage = "Dad must be mowing the lawn. No jokes available at this time. Try again later."
        }
        
        isLoading = false
    }
    
    @MainActor
    func reset() {
        joke = nil
        isLoading = false
        errorMessage = nil
    }
}
