//
//  TabBaseView.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import SwiftUI

protocol TabBaseViewProtocol {
    // View components
    var title: String { get }
    var systemImage: String { get }
    var subtitle: String { get }
    var buttonText: String { get }
    
    // Data components
    func fetchData() async
    func resetData()
    
    // View transitionst
    associatedtype SheetView: View
    func launchSheet() -> SheetView
}

struct TabBaseView<T: TabBaseViewProtocol>: View {
    @State var isShowingSheet: Bool = false
    
    let viewModel: T
    
    var body: some View {
        VStack {
            Text(viewModel.title)
                .font(.system(size: 42, weight: .bold, design: .serif))
                .foregroundStyle(.emPrimary)
            
            Image(systemName: viewModel.systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundStyle(.emPrimary)
            
            Text(viewModel.subtitle)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.emSecondary)
                .padding(36)
            
            Button(viewModel.buttonText) {
                Task { await viewModel.fetchData() }
                isShowingSheet = true
            }
            .modifier(EMButtonViewModifier())
        }
        .sheet(isPresented: $isShowingSheet) { viewModel.launchSheet() }
    }
}

#Preview("Dad Jokes") { TabBaseView(viewModel: DadJokeViewModel()) }
#Preview("Random Facts") { TabBaseView(viewModel: RandomFactViewModel()) }
#Preview("Trivia") { TabBaseView(viewModel: TriviaViewModel()) }
