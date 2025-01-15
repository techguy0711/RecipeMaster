//
//  HomeScreen.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    @ObservedObject var logic = RecipeLogic()
    
    var emptyRecipeView: some View {
        VStack(alignment: .center) {
            Text("☹️")
                .bold()
                .font(.largeTitle)
            Text("No recipes yet!")
                .bold()
                .font(.title)
            Text("We will be adding more recipes soon. Please check back shortly.")
                .font(.body)
        }
    }
    
    @ViewBuilder
    func recipeRow(_ recipe: Recipe) -> some View {
        LazyVStack {
            if let url = URL(string: recipe.photoURLLarge) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .accessibilityIdentifier(accessibilityIdentifires.rowImage.rawValue)
                        .accessibilityLabel(recipe.name)
                } placeholder: {
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .scaledToFit()
                        .accessibilityIdentifier(accessibilityIdentifires.rowImage.rawValue)
                        .accessibilityLabel(recipe.name)
                }
            }
            Text(recipe.name)
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
                .lineLimit(3)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.leading)
                .accessibilityIdentifier(accessibilityIdentifires.rowTitle.rawValue)
            Text(recipe.cuisine)
                .font(.body)
                .accessibilityIdentifier(accessibilityIdentifires.rowCusine.rawValue)
        }
    }
    
    @ViewBuilder
    func successView(_ recipes: [Recipe]) -> some View {
        if recipes.isEmpty {
            emptyRecipeView
        } else {
            List {
                ForEach(recipes, id: \.uuid) { recipe in
                    NavigationLink {
                        DetailScreen(recipe: recipe)
                    } label: {
                        recipeRow(recipe)
                    }

                }
            }
        }
    }
    
    var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
    
    var errorView: some View {
        VStack(alignment: .center) {
            Text("☹️")
                .bold()
                .font(.largeTitle)
            Text("Woops...")
                .bold()
                .font(.title)
            Text("We are sorry for the inconvenience please try again in a few minutes.")
                .font(.body)
        }
    }
    
    var body: some View {
        VStack {
            switch logic.recipesState {
            case .initial:
                EmptyView()
            case .loading:
                loadingView
            case .success(let recipes):
                successView(recipes.recipes)
            case .error:
                errorView
            }
        }
        .navigationTitle("Recipes")
        .refreshable {
            await logic.fetchRecipes()
        }
        .task {
            await logic.fetchRecipes()
        }
    }
}

extension HomeScreen {
    enum accessibilityIdentifires: String {
        case rowTitle = "row_title"
        case rowImage = "row_image"
        case rowCusine = "row_cusine"
    }
}
