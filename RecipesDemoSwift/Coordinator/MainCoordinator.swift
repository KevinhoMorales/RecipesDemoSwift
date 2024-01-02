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
}
