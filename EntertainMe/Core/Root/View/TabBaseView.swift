//
//  TabBaseView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/28/24.
//

import SwiftUI

struct TabBaseView: View {
    let context: Context
    
    var body: some View {
        VStack(spacing: 24) {
            Text(context.title)
                .font(.system(size: 42, weight: .bold, design: .serif))
                .foregroundStyle(.emPrimary)
            
            Image(systemName: context.systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.emPrimary)
            
            Text(context.subtitle)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.emSecondary)
                .padding(36)
            
            Button(context.buttonText) {
                print("\(context.title) button tapped!")
            }
            .buttonStyle(.borderedProminent)
            .tint(.emPrimary)
            .foregroundStyle(.emButtonText)
            .fontWeight(.bold)
            .controlSize(.extraLarge)
        }
    }
}

extension TabBaseView {
    enum Context {
        case dadJoke
        case randomFact
        case trivia
        
        var title: String {
            switch self {
            case .dadJoke: return "Dad Jokes"
            case .randomFact: return "Random Facts"
            case .trivia: return "Trivia"
            }
        }
        
        var systemImage: String {
            switch self {
            case .dadJoke: return "theatermasks.fill"
            case .randomFact: return "lightbulb.fill"
            case .trivia: return "brain.head.profile"
            }
        }
        
        var subtitle: String {
            switch self {
            case .dadJoke: return "Warning: Side effects may include eye-rolling and unexpected chuckles."
            case .randomFact: return "Expand your knowledge with bite-sized fascinating facts."
            case .trivia: return "Challenge yourself with questions that'll make you think twice."
            }
        }
        
        var buttonText: String {
            switch self {
            case .dadJoke: return "Get a Joke!"
            case .randomFact: return "Get a Fact!"
            case .trivia: return "Play Trivia!"
            }
        }
    }
}

#Preview("Dad Jokes") { TabBaseView(context: .dadJoke) }
#Preview("Random Facts") { TabBaseView(context: .randomFact) }
#Preview("Trivia") { TabBaseView(context: .trivia) }
