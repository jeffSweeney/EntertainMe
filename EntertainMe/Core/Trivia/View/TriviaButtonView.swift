//
//  TriviaButtonView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/31/24.
//

import SwiftUI

struct TriviaButtonView: View {
    @State private var borderColor: Color = .emPrimary
    @State private var hasBeenTapped: Bool = false
    
    let content: String
    let correctAnswer: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.2)) {
                borderColor = correctAnswer ? .green : .red
                hasBeenTapped = true
            }
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.clear)
                Text(content)
                    .padding(6)
                    .foregroundStyle(.emSecondary)
                    .font(.headline)
                    .minimumScaleFactor(0.5)
            }
            .frame(width: 300, height: 65)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 3)
            }
            .scaleEffect(hasBeenTapped ? 0.95 : 1.0) // Shrinks slightly when tapped
        }
        .disabled(hasBeenTapped)
    }
}

#Preview {
    VStack(spacing: 16) {
        TriviaButtonView(content: "Incorrect Answer", correctAnswer: false)
        TriviaButtonView(content: "Correct Answer", correctAnswer: true)
        TriviaButtonView(content: "Incorrect Answer", correctAnswer: false)
        TriviaButtonView(content: "Incorrect Answer", correctAnswer: false)

    }
}
