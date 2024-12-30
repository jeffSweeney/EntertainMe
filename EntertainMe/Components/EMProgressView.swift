//
//  EMProgressView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

struct EMProgressView: View {
    let caption: String
    
    var body: some View {
        VStack(spacing: 48) {
            ProgressView()
                .foregroundStyle(.emPrimary)
                .scaleEffect(2)
            
            Text(caption)
                .foregroundColor(.emSecondary)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.85)
                .lineLimit(3)
        }
    }
}

#Preview {
    EMProgressView(caption: "Dad is thinking ... 🤔🥸")
}
