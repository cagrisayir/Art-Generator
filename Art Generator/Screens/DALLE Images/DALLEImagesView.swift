//
//  ContentView.swift
//  Art Generator
//
//  Created by Omer Cagri Sayir on 13.01.2024.
//

import SwiftUI

struct DALLEImagesView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                if !vm.urls.isEmpty {
                    HStack {
                        ForEach(vm.dallEImages) { dalleImage in
                            if let uiImage = dalleImage.uiImage {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .onTapGesture {
                                        vm.selectedImage = uiImage
                                    }
                            } else {
                                ProgressView()
                                    .frame(width: 80, height: 80)
                            }
                        }
                    }
                }
                if !vm.fetching {
                    if !vm.urls.isEmpty {
                        Text("Select an image")
                    }
                    if let selectedImage = vm.selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 256, height: 256)
                    }
                    if vm.urls.isEmpty {
                        Text("The more descriptive you can be, the better")
                        TextField("Image Description...", text: $vm.prompt, axis: .vertical)
                            .textFieldStyle(.roundedBorder)
                            .padding()

                        Button("Fetch") {
                            vm.fetchImages()
                        }
                        .disabled(vm.prompt.isEmpty)
                        .buttonStyle(.borderedProminent)
                    } else {
                        Button("Try another") {
                            vm.clearProperties()
                        }.buttonStyle(.borderedProminent)
                    }
                } else {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("Art Generator")
        }
    }
}

#Preview {
    DALLEImagesView()
}
