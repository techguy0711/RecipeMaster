//
//  Flicker.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//


import Foundation

// MARK: - Flicker
struct Recipes: Codable, Equatable {
    static func == (lhs: Recipes, rhs: Recipes) -> Bool {
        lhs.recipes == rhs.recipes
    }
    
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Codable, Equatable {
    let cuisine, name: String
    let photoURLLarge, photoURLSmall: String
    let sourceURL: String?
    let uuid: String
    let youtubeURL: String?

    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case photoURLLarge = "photo_url_large"
        case photoURLSmall = "photo_url_small"
        case sourceURL = "source_url"
        case uuid
        case youtubeURL = "youtube_url"
    }
}
