//
//  RecipesResponse.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import Foundation

struct RecipesResponse: Codable {
    var recipes: [Recipe]
}

struct Recipe: Codable {
    let id: String
    let name: String
    let description: String
    let country: String
    let city: String
    let latitude: String
    let longitude: String
    let emoji: String
    let imageURL: String
}
