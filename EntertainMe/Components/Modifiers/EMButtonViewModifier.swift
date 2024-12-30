//
//  EMButtonViewModifier.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

struct EMButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .tint(.emPrimary)
            .foregroundStyle(.emButtonText)
            .fontWeight(.bold)
            .controlSize(.extraLarge)
            .shadow(color: .emSecondary.opacity(0.5), radius: 8, x: 4, y: 4)
    }
}
