//
//  EMContentPresenterProtocol.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/30/24.
//

import Foundation

protocol EMContentPresenterProtocol {
    var logo: String { get }
    var content: String { get }
}

final class EMDadJokePresenter: EMContentPresenterProtocol {
    let logo: String = "theatermasks.fill"
    let content: String
    
    init(joke: String) {
        content = joke
    }
}

final class EMRandomFactPresenter: EMContentPresenterProtocol {
    let logo: String = "lightbulb.fill"
    let content: String
    
    init(fact: String) {
        content = fact
    }
}

final class EMErrorPresenter: EMContentPresenterProtocol {
    let logo: String = "exclamationmark.octagon.fill"
    let content: String
    
    init(error: String) {
        content = error
    }
}
