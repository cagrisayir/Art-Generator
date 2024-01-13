//
//  Models.swift
//  Art Generator
//
//  Created by Omer Cagri Sayir on 13.01.2024.
//

import Foundation

enum Constants {
    static let imageSize = "256x256"
    static let n = 1
}

struct GenerationInput: Codable {
    var prompt: String
    var n = Constants.n
    var size = Constants.imageSize
    
    var encodedData: Data? {
        try? JSONEncoder().encode(self)
    }
}
