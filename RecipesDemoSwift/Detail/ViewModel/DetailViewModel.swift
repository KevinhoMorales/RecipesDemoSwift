//
//  DetailViewModel.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import Foundation

protocol DetailViewModelProtocol {
    func getTitle() -> String
    func getRecipe() -> Recipe
}

final class DetailViewModel: DetailViewModelProtocol {
    private var view: DetailViewProtocol
    private var recipe: Recipe
    
    init(view: DetailViewProtocol, recipe: Recipe) {
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
