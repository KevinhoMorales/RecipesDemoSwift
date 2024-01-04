//
//  RecipeMapViewController.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 3/1/24.
//

import UIKit
import MapKit

protocol RecipeMapViewProtocol {
    
}

final class RecipeMapViewController: MainViewController, RecipeMapViewProtocol {
    
    @IBOutlet private weak var mapView: MKMapView!
    
    var viewModel: RecipeMapViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        guard let viewModel else { return }
        title = viewModel.getTitle()
        setUpMap()
    }
    
    @IBAction private func closeAction(_ sender: Any) {
        tapHaptic()
        dismiss(animated: true)
    }
}

extension RecipeMapViewController: MKMapViewDelegate {
    private func setUpMap() {
        guard let viewModel else { return }
        let annotation = MKPointAnnotation()
        annotation.title = viewModel.getTitle()
        annotation.subtitle = viewModel.getRecipe().emoji
        let latitude = Double(viewModel.getRecipe().latitude) ?? 0.0
        let longitude = Double(viewModel.getRecipe().longitude) ?? 0.0
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        mapView.showAnnotations([annotation], animated: true)
        mapView.addAnnotation(annotation)
    }
}
