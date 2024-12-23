//
//  NetworkService.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/23/24.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {} // Adhere to singleton pattern
}

// MARK: Dad Joke Partition
extension NetworkService {
    func fetchDadJoke() async throws -> DadJoke {
        var components = URLComponents(string: "https://icanhazdadjoke.com/")
        components?.queryItems = [URLQueryItem(name: "amount", value: "1")]
        
        guard let url = components?.url else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let dadJoke = try JSONDecoder().decode(DadJoke.self, from: data)
        
        return dadJoke
    }
}

// MARK: Random Fact Partition
extension NetworkService {
    
}

// MARK: Trivia Partition
extension NetworkService {
    
}
