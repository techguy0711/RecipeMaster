//
//  DetailScreen.swift
//  RecipeMaster
//
//  Created by Kristhian De Oliveira on 1/15/25.
//

import Foundation
import SwiftUI
import AVKit
import WebKit

struct DetailScreen: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            if let youtubeURL = recipe.youtubeURL {
                YouTubeView(url: youtubeURL)
            } else {
                if let urlString = recipe.sourceURL,
                   let url = URL(string: urlString) {
                    WebView(url: url)
                }
            }
        }
    }
}
