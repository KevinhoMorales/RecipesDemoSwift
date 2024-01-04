//
//  UIImageView+Extension.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    func downloadImageByURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        self.kf.setImage(with: url)
    }
}
