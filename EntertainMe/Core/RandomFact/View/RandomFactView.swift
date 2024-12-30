//
//  RandomFactView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

struct RandomFactView: View {
    @ObservedObject var viewModel: RandomFactViewModel
    
    var body: some View {
        // TODO: Implement
        if viewModel.isLoading {
            Text("Loading...")
        } else if viewModel.errorMessage != nil {
            Text("Error: \(viewModel.errorMessage!)")
        } else if let fact = viewModel.fact?.text {
            Text(fact)
        } else {
            Text("No fact found :(")
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
