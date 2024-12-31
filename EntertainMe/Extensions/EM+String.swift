//
//  EM+String.swift
//  EntertainMe
//
//  Created by Jeffrey Sweeney on 12/31/24.
//

import Foundation

extension String {
    func decodedHTML() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        do {
            let attributedString = try NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil
            )
            return attributedString.string
        } catch {
            print("Error decoding HTML: \(error)")
            return self
        }
    }
}
