//
//  DadJokeView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

struct DadJokeView: View {
    @ObservedObject var viewModel: DadJokeViewModel
    
    var body: some View {
        // TODO: Implement
        if viewModel.isLoading {
            Text("Loading...")
        } else if viewModel.errorMessage != nil {
            Text("Error: \(viewModel.errorMessage!)")
        } else if let joke = viewModel.dadJoke?.joke {
            Text(joke)
        } else {
            Text("No joke found :(")
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
