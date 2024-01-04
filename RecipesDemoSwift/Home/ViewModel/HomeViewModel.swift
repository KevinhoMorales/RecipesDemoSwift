//
//  HomeViewModel.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import Foundation

protocol HomeViewModelProtocol {
    var recipes: [Recipe] { get set }
    func getTitle() -> String
    func getRecipes() -> [Recipe]
    func retrieveRecipes(completion: @escaping(([Recipe]) -> Void))
}

final class HomeViewModel: HomeViewModelProtocol {
    private var view: HomeViewProtocol
    var recipes = [Recipe]()
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func getTitle() -> String {
        "Recipes"
    }

    func getRecipes() -> [Recipe] {
        recipes
    }
    
    func retrieveRecipes(completion: @escaping(([Recipe]) -> Void)) {
        let recipesRequest = RecipesRequest()
        let model = RecipesModel()
        recipesRequest.get(model: model) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    completion(response.recipes)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
