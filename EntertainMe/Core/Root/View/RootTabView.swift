//
//  RootTabView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

struct RootTabView: View {
    @StateObject var dadJokeViewModel = DadJokeViewModel()
    @StateObject var randomFactViewModel = RandomFactViewModel()
    @StateObject var triviaViewModel = TriviaViewModel()
    
    var body: some View {
        TabView {
            Tab("Dad Joke", systemImage: "theatermasks.fill") {
                TabBaseView(viewModel: dadJokeViewModel)
            }
            
            Tab("Random Fact", systemImage: "lightbulb.fill") {
                TabBaseView(viewModel: randomFactViewModel)
            }
            
            Tab("Trivia", systemImage: "brain.head.profile") {
                TabBaseView(viewModel: triviaViewModel)
            }
        }
        .tint(.emSecondary)
    }
}

#Preview {
    RootTabView()
}
