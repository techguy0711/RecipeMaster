//
//  State.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//


enum RecipesState {
    case initial
    case loading
    case success(Recipes)
    case error
}
