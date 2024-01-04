//
//  RecipeMapViewModel.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import Foundation

protocol RecipeMapViewModelProtocol {
    func getTitle() -> String
    func getRecipe() -> Recipe
}

final class RecipeMapViewModel: RecipeMapViewModelProtocol {
    private var view: RecipeMapViewProtocol
    private var recipe: Recipe
    
    init(view: RecipeMapViewProtocol, recipe: Recipe) {
        self.view = view
        self.recipe = recipe
    }
    
    func getTitle() -> String {
        getRecipe().name
    }
    
    func getRecipe() -> Recipe {
        recipe
    }
}
