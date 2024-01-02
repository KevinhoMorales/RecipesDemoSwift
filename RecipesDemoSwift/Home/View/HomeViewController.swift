//
//  HomeViewController.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import UIKit

protocol HomeViewProtocol {
    
}

final class HomeViewController: MainViewController, HomeViewProtocol {
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    private func setUpView() {
        title = viewModel?.getTitle()
    }
}
