//
//  APIService.swift
//  Art Generator
//
//  Created by Omer Cagri Sayir on 13.01.2024.
//

import Foundation

class APIService {
    let baseURL = "https://api.openai.com/v1/images/"
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String

    func fetchImages(with data: Data) async throws {
        guard let apiKey else { fatalError("Could not get API KEY") }
        guard let url = URL(string: baseURL + "generations") else {
            fatalError("Error: Invalid URL")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = data

        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse) != nil else {
            fatalError("Error: Data Request Error")
        }

        print(String(decoding: data, as: UTF8.self))
    }
}
