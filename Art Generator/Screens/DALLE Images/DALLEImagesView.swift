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

                        Form {
                            Picker("Style", selection: $vm.imageStyle) {
                                ForEach(ImageStyle.allCases, id: \.self) { imageStyle in
                                    Text(imageStyle.rawValue.capitalized)
                                }
                            }

                            Picker("Image Medium", selection: $vm.imageMedium) {
                                ForEach(ImageMedium.allCases, id: \.self) { imageMedium in
                                    Text(imageMedium.rawValue.capitalized)
                                }
                            }

                            Picker("Artist", selection: $vm.artist) {
                                ForEach(Artist.allCases, id: \.self) { artist in
                                    Text(artist.rawValue.capitalized)
                                }
                            }
                            HStack {
                                Spacer()
                                Button("Fetch") {
                                    vm.fetchImages()
                                }
                                .disabled(vm.prompt.isEmpty)
                                .buttonStyle(.borderedProminent)
                            }
                            HStack {
                                Spacer()
                                if vm.urls.isEmpty || vm.selectedImage == nil {
                                    Image("artist")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                }
                                Spacer()
                            }
                        }
                    } else {
                        Text(vm.description)
                            .padding()
                        HStack {
                            if vm.selectedImage != nil {
                                Button("Get variations") {
                                    vm.fetchVariations()
                                }
                            }
                            Button("Try another") {
                                vm.reset()
                            }
                        }.buttonStyle(.borderedProminent)
                    }
                } else {
                    ProgressView()
                }
                if vm.selectedImage == nil && !vm.urls.isEmpty {
                    Image("artist")
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                Spacer()
            }
            .navigationTitle("Art Generator")
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

#Preview {
    DALLEImagesView()
}
