//
//  NetworkManager.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

import Foundation
import Combine

class NetworkManager: NetworkUseCases {
    
    func fetchRecipes() async throws -> Recipes {
        let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        guard let url = URL(string: urlString) else { fatalError("Invalid URL") }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let recipes = try JSONDecoder().decode(Recipes.self, from: data)
        
        return recipes
    }
    
}
