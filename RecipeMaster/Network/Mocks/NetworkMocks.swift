//
//  NetworkMocks.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

class NetworkMocks: NetworkUseCases {
    var didFetchRecipes = false
    
    func fetchRecipes() async throws -> Recipes {
        didFetchRecipes = true
        return Recipes(
            recipes: [
                Recipe(
                    cuisine: "Italian",
                    name: "Bologness",
                    photoURLLarge: "",
                    photoURLSmall: "",
                    sourceURL: "",
                    uuid: "123",
                    youtubeURL: ""
                )
            ]
        )
    }
}
