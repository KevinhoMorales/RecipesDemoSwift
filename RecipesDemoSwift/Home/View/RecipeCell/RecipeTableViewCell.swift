//
//  RecipeTableViewCell.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 2/1/24.
//

import UIKit

final class RecipeTableViewCell: UITableViewCell {

    @IBOutlet private weak var recipeImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    @IBOutlet private weak var emojiLabel: UILabel!
        
    static let CELL_ID = "RECIPE_CELL_ID"
    
    func setUp(recipe: Recipe) {
        recipeImageView.downloadImageByURL(urlString: recipe.imageURL)
        nameLabel.text = recipe.name
        descriptionLabel.text = recipe.description
        countryLabel.text = recipe.city + ", " + recipe.country
        emojiLabel.text = recipe.emoji
    }
}
