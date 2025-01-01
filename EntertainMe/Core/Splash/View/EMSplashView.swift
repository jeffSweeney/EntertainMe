//
//  EMSplashView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/31/24.
//

import SwiftUI

struct EMSplashView: View {
    @Binding var showingSplash: Bool
    
    @State private var currentImageIndex = 0
    @State private var imageScale: CGFloat = 0.1
    @State private var imageOpacity: Double = 0

    let images = ["theatermasks.fill", "lightbulb.fill", "brain.head.profile"]
    private var logoColor: Color { currentImageIndex % 2 == 0 ? .emPrimary : .emSecondary }
    
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            
            Image(systemName: images[currentImageIndex])
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 400)
                .foregroundStyle(logoColor)
                .scaleEffect(imageScale)
                .opacity(imageOpacity)
                .shadow(color: .secondary, radius: 75)
        }
        .onAppear {
            startAnimation()
        }
    }
    
    func startAnimation() {
        // Initial delay before starting
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            animateImage()
        }
    }
    
    func animateImage() {
        // Fade in and scale up
        withAnimation(.easeIn(duration: 1.75)) {
            imageScale = 1.0
            imageOpacity = 1.0
        }
        
        // Hold at full size
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            // Fade out and scale down
            withAnimation(.easeOut(duration: 2.0)) {
                imageScale = 0.1
                imageOpacity = 0
            }
            
            // Prepare for next image
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.75) {
                if currentImageIndex < images.count - 1 {
                    currentImageIndex += 1
                    animateImage()
                } else {
                    showingSplash = false
                }
            }
        }
    }
}

#Preview {
    EMSplashView(showingSplash: .constant(true))
}
