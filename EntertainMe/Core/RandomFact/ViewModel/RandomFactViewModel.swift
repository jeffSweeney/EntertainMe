//
//  RandomFactViewModel.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

@Observable
final class RandomFactViewModel {
    var fact: RandomFact? = nil
    var isLoading: Bool = false
    var errorMessage: String? = nil
    
    @MainActor
    func fetchFact() async {
        isLoading = true
        
        do {
            fact = try await NetworkService.shared.fetchRandomFact()
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
