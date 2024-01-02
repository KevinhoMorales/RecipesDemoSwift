//
//  MainViewController.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func tapHaptic() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.impactOccurred(intensity: 1.0)
    }
    
}
