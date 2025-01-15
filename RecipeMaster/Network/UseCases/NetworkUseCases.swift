//
//  NetworkUseCases.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

protocol NetworkUseCases {
    func fetchRecipes() async throws -> Recipes
}
