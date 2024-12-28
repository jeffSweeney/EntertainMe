//
//  RootTabView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

struct RootTabView: View {
    
    var body: some View {
        TabView {
            Tab("Dad Joke", systemImage: "theatermasks.fill") {
                TabBaseView(context: .dadJoke)
            }
            
            Tab("Random Fact", systemImage: "lightbulb.fill") {
                TabBaseView(context: .randomFact)
            }
            
            Tab("Trivia", systemImage: "brain.head.profile") {
                TabBaseView(context: .trivia)
            }
        }
        .tint(.emSecondary)
    }
}

#Preview {
    RootTabView()
}
