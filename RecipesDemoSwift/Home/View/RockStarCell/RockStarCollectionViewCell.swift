//
//  RockStarCollectionViewCell.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import UIKit

class RockStarCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var recipeImageView: UIImageView!

    static let CELL_ID = "ROCK_STAR_CELL_ID"
    
    func setUp(recipe: Recipe) {
        recipeImageView.downloadImageByURL(urlString: recipe.imageURL)
    }

}
