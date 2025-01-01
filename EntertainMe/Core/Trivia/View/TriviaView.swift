//
//  TriviaView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/31/24.
//

import SwiftUI

struct TriviaView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TriviaViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if let question = viewModel.triviaQuestion, let answers = viewModel.triviaAnswers, !viewModel.isLoading {
                    mainTriviaView(question: question, answers: answers)
                } else if viewModel.isLoading {
                    EMProgressView(caption: "Assembling brain teasers ... 🛠️🧩")
                } else if let errorMessage = viewModel.errorMessage {
                    EMContentPresenterView(presenter: EMErrorPresenter(error: errorMessage))
                } else {
                    EMContentPresenterView(presenter: EMErrorPresenter(error: "No trivia found 😭"))
                }
            }
            .navigationTitle("Trivia 🧠")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func mainTriviaView(question: String, answers: [TriviaAnswer]) -> some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(systemName: viewModel.systemImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.emPrimary)
                    .padding()
                
                Text(question)
                    .foregroundStyle(.emSecondary)
                    .font(.headline)
                    .padding(16)
                    .multilineTextAlignment(.center)
                
                ForEach(answers) { answer in
                    TriviaButtonView(content: answer.content, correctAnswer: answer.correctAnswer)
                }
                
                Button("Get More Trivia!") {
                    Task { await viewModel.fetchData() }
                }
                .modifier(EMButtonViewModifier())
                .padding(.vertical, 28)
                
                Button("MORE ENTERTAINMENT") {
                    Task { dismiss() }
                }
                .font(.system(size: 18, weight: .bold, design: .serif))
                .foregroundStyle(.emPrimary)
            }
        }
    }
}

#Preview("Happy Path") {
    let question: String = "This is the test question? Yes, I believe this is the question!"
    let answers: [TriviaAnswer] = [
        TriviaAnswer(content: "This is Answer 1", correctAnswer: false),
        TriviaAnswer(content: "And Answer 2", correctAnswer: true),
        TriviaAnswer(content: "Now this is Answer 3", correctAnswer: false),
        TriviaAnswer(content: "Here's Answer 4", correctAnswer: false),
    ]
    TriviaView(viewModel: TriviaViewModel(triviaQuestion: question, triviaAnswers: answers))
}
