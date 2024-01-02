//
//  Coordinator.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func homeView()
}
