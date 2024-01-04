//
//  MainCoordinator.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController = UINavigationController()
    
    func homeView() {
        let homeView = HomeViewController(nibName: String(describing: HomeViewController.self), bundle: Bundle.main)
        let homeViewModel = HomeViewModel(view: homeView)
        homeView.viewModel = homeViewModel
        homeView.coordinator = self
        navigationController.pushViewController(homeView, animated: true)
    }
    
    func detalView(recipe: Recipe) {
        let detalView = DetailViewController(nibName: String(describing: DetailViewController.self), bundle: Bundle.main)
        let detalViewModel = DetailViewModel(view: detalView, recipe: recipe)
        detalView.viewModel = detalViewModel
        detalView.coordinator = self
        navigationController.pushViewController(detalView, animated: true)
    }
    
    func recipeMapView(recipe: Recipe) {
        let recipeMapView = RecipeMapViewController(nibName: String(describing: RecipeMapViewController.self), bundle: Bundle.main)
        let recipeMapViewModel = RecipeMapViewModel(view: recipeMapView, recipe: recipe)
        recipeMapView.viewModel = recipeMapViewModel
        recipeMapView.coordinator = self
        navigationController.present(recipeMapView, animated: true)
    }
}
