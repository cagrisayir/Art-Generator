//
//  Styles.swift
//  Art Generator
//
//  Created by Omer Cagri Sayir on 27.01.2024.
//

import Foundation

enum ImageStyle: String, CaseIterable {
    case none
    case abstract
    case cartoon
    case comic
    case expressionism
    case impressionism
    case popArt = "pop art"
    case realism
    case renaissance
    case surrealism

    var description: String {
        self != .none ? "an image in the style of " + rawValue + " " : ""
    }
}

enum ImageMedium: String, CaseIterable {
    case none
    case digital = "digital art"
    case oil = "oil painting"
    case pastel
    case photo
    case spray = "spray paint"
    case watercolor

    var description: String {
        self != .none ? "using the medium of " + rawValue + " " : ""
    }
}

enum Artist: String, CaseIterable {
    case none
    case dali = "Savador Dali"
    case davinci = "Leonarda da Vinci"
    case matisse = "Henri Matisse"
    case monet = "Claud Monet"
    case picasso = "Pablo Picasso"
    case pollock = "Jackson Pollock"
    case vangogh = "Vincent van Gogh"

    var description: String {
        self != .none ? "similar to the works of " + rawValue + " " : ""
    }
}
