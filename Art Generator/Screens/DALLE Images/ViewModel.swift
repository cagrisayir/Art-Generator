//
//  ViewModel.swift
//  Art Generator
//
//  Created by Omer Cagri Sayir on 13.01.2024.
//

import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    @Published var prompt = ""
    @Published var urls: [URL] = [URL]()
    @Published var dallEImages: [DalleImage] = []
    @Published var fetching = false

    let apiService = APIService()

    func clearProperties() {
        urls = []
        dallEImages.removeAll()

        for _ in 1 ... Constants.n {
            dallEImages.append(DalleImage())
        }
    }

    init() {
        clearProperties()
    }

    func fetchImages() {
        clearProperties()
        withAnimation {
            fetching.toggle()
        }

        let generationInput = GenerationInput(prompt: prompt)
        Task {
            if let data = generationInput.encodedData {
                do {
                    let response = try await apiService.fetchImages(with: data)
                    for data in response.data {
                        urls.append(data.url)
                    }
                    withAnimation {
                        fetching.toggle()
                    }
                    for (index, url) in urls.enumerated() {
                        dallEImages[index].uiImage = await apiService.loadImage(at: url)
                    }
                } catch {
                    print(error.localizedDescription)
                    fetching.toggle()
                }
            }
        }
    }
}
