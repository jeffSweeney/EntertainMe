//
//  RandomFactView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

struct RandomFactView: View {
    @ObservedObject var viewModel: RandomFactViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Group {
                if let fact = viewModel.fact?.text, !viewModel.isLoading {
                    mainFactView(fact: fact)
                }
                else if viewModel.isLoading {
                    EMProgressView(caption: "Fact engines warming up ... 🔍✨")
                } else if let errorMessage = viewModel.errorMessage {
                    EMContentPresenterView(presenter: EMErrorPresenter(error: errorMessage))
                } else {
                    EMContentPresenterView(presenter: EMErrorPresenter(error: "No fact found 😭"))
                }
            }
            .navigationTitle("Random Fact 🤔")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func mainFactView(fact: String) -> some View {
        VStack {
            EMContentPresenterView(presenter: EMRandomFactPresenter(fact: fact))
            
            Button("Get Another Fact!") {
                Task { await viewModel.fetchData() }
            }
            .modifier(EMButtonViewModifier())
            .padding(.vertical, 36)
            
            Button("MORE ENTERTAINMENT") {
                Task { dismiss() }
            }
            .font(.system(size: 18, weight: .bold, design: .serif))
            .foregroundStyle(.emPrimary)
        }
    }
}

#Preview("Happy Path") {
    let fact = RandomFact(id: "", text: "The average American spends 100 hours a week watching television.")
    let randomFactViewModel = RandomFactViewModel(fact: fact)
    RandomFactView(viewModel: randomFactViewModel)
}

#Preview("Loading") {
    let randomFactViewModel = RandomFactViewModel(isLoading: true)
    RandomFactView(viewModel: randomFactViewModel)
}

#Preview("Error") {
    let randomFactViewModel = RandomFactViewModel(errorMessage: "Fact: We encountered an error trying to fetch a fact ... awkward. Try again later.")
    RandomFactView(viewModel: randomFactViewModel)
}
