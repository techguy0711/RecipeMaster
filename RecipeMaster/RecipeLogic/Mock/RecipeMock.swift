//
//  RecipeMock.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

import Foundation
import Combine

class RecipeMock: RecipeUseCases {
    private var mock = NetworkMocks()
    var didFetchRecipes = false
    @Published var state: RecipesState = .initial
    
    func fetchRecipes() async {
        didFetchRecipes = true
        DispatchQueue.main.async {
            self.state = .loading
        }
        do {
            let response = try await mock.fetchRecipes()
            DispatchQueue.main.async {
                self.state = .success(response)
            }
        } catch {
            DispatchQueue.main.async {
                self.state = .error
            }
        }
        
    }
}
