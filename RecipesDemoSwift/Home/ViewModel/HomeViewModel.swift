//
//  HomeViewModel.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import Foundation

protocol HomeViewModelProtocol {
    func getTitle() -> String
}

final class HomeViewModel: HomeViewModelProtocol {
    private var view: HomeViewProtocol
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func getTitle() -> String {
        "Recipes"
    }
}
