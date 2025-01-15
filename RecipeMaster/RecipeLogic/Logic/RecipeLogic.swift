//
//  RecipeLogic.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

import Foundation
import Combine

class RecipeLogic: ObservableObject, RecipeUseCases {
    let network: NetworkManager
    
    @Published var recipesState: RecipesState = .initial
    
    init(network: NetworkManager = NetworkManager()) {
        self.network = network
    }
    
    func fetchRecipes() async {
        DispatchQueue.main.async {
            self.recipesState = .loading
        }
        do {
            let response = try await network.fetchRecipes()
            DispatchQueue.main.async {
                self.recipesState = .success(response)
            }
        } catch {
            recipesState = .error
        }
    }
}
