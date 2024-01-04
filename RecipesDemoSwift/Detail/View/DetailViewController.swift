//
//  DetailViewController.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import UIKit

protocol DetailViewProtocol {
    
}

final class DetailViewController: MainViewController, DetailViewProtocol {
    
    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    
    var viewModel: DetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        guard let viewModel else { return }
        title = viewModel.getTitle()
        recipeImageView.downloadImageByURL(urlString: viewModel.getRecipe().imageURL)
        descriptionLabel.text = viewModel.getRecipe().description
        countryLabel.text = viewModel.getRecipe().city + ", " + viewModel.getRecipe().country + " " + viewModel.getRecipe().emoji
    }
    
    @IBAction private func openMapAction(_ sender: Any) {
        guard let viewModel else { return }
        tapHaptic()
        coordinator?.recipeMapView(recipe: viewModel.getRecipe())
    }
    
}
