//
//  DadJokeView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

struct DadJokeView: View {
    @ObservedObject var viewModel: DadJokeViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            currentView()
                .navigationTitle(Text("Dad Joke 😂"))
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension DadJokeView {
    private func currentView() -> some View {
        Group {
            if let joke = viewModel.dadJoke?.joke, !viewModel.isLoading {
                mainJokeView(joke: joke)
            } else if viewModel.isLoading {
                EMProgressView(caption: "Dad is thinking ... 🤔🥸")
            } else if let errorMessage = viewModel.errorMessage {
                EMContentPresenterView(presenter: EMErrorPresenter(error: errorMessage))
            } else {
                EMContentPresenterView(presenter: EMErrorPresenter(error: "No joke found 😭"))
            }
        }
    }
    
    private func mainJokeView(joke: String) -> some View {
        VStack {
            EMContentPresenterView(presenter: EMDadJokePresenter(joke: joke))
            
            Button("Get Another Joke!") {
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
    let dadJoke = DadJoke(id: "", joke: "What do you call a cow with no legs? A steer!")
    let dadJokeViewModel = DadJokeViewModel(dadJoke: dadJoke)
    DadJokeView(viewModel: dadJokeViewModel)
}

#Preview("Loading") {
    let dadJokeViewModel = DadJokeViewModel(isLoading: true)
    DadJokeView(viewModel: dadJokeViewModel)
}

#Preview("Error") {
    let dadJokeViewModel = DadJokeViewModel(errorMessage: "Dad must be mowing the lawn. No jokes available at this time. Try again later.")
    DadJokeView(viewModel: dadJokeViewModel)
}
