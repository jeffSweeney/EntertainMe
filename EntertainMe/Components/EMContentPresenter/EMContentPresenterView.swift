//
//  EMContentPresenterView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

struct EMContentPresenterView<T: EMContentPresenterProtocol>: View {
    @Environment(\.dismiss) var dismiss
    
    let presenter: T
    
    var body: some View {
        VStack(spacing: 36) {
            Image(systemName: presenter.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(.emPrimary)
            
            Text(presenter.content)
                .foregroundStyle(.emSecondary)
                .font(.headline)
                .padding(.horizontal, 24)
                .multilineTextAlignment(.center)
            
            Button("More Entertainment!") {
                dismiss()
            }
            .modifier(EMButtonViewModifier())
            .padding(.vertical, 36)
        }
    }
}

#Preview("Dad Joke") {
    EMContentPresenterView(presenter: EMDadJokePresenter(joke: "What do you call a cow with no legs? A steer!"))
}

#Preview("Random Fact") {
    EMContentPresenterView(presenter: EMRandomFactPresenter(fact: "Bacon is a type of meat that is not actually meat."))
}

#Preview("Error - Dad Joke") {
    EMContentPresenterView(presenter: EMErrorPresenter(error: "Dad must be mowing the lawn. No jokes available at this time. Try again later."))
}

#Preview("Error - Random Fact") {
    EMContentPresenterView(presenter: EMErrorPresenter(error: "Fact: We encountered an error trying to fetch a fact ... awkward. Try again later."))
}
