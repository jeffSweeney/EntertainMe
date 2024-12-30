//
//  RandomFactViewModel.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

final class RandomFactViewModel: ObservableObject {
    @Published var fact: RandomFact?
    @Published var isLoading: Bool
    @Published var errorMessage: String?
    
    init(fact: RandomFact? = nil, isLoading: Bool = false, errorMessage: String? = nil) {
        self.fact = fact
        self.isLoading = isLoading
        self.errorMessage = errorMessage
    }
    
    @MainActor
    func fetchFact() async {
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000) // Simulate 2 second delay
            fact = try await NetworkService.shared.fetchRandomFact()
            errorMessage = nil
        } catch {
            errorMessage = "Fact: We encountered an error trying to fetch a fact ... awkward. Try again later."
        }
        
        isLoading = false
    }
    
    @MainActor
    func reset() {
        fact = nil
        isLoading = false
        errorMessage = nil
    }
}
