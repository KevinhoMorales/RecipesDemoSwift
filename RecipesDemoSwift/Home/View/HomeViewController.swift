//
//  HomeViewController.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import UIKit

protocol HomeViewProtocol {
    func reloadData()
}

final class HomeViewController: MainViewController, HomeViewProtocol {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView() {
        guard var viewModel else { return }
        title = viewModel.getTitle()
        setUpCells()
        viewModel.retrieveRecipes { [weak self] recipes in
            viewModel.recipes = recipes
            self?.reloadData()
        }
    }
    
    private func setUpCells() {
        let recipeCell = UINib(nibName: String(describing: RecipeTableViewCell.self), bundle: .main)
        tableView.register(recipeCell, forCellReuseIdentifier: RecipeTableViewCell.CELL_ID)
    }
}

extension HomeViewController {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel else { return 0 }
        return viewModel.getRecipes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeTableViewCell.CELL_ID, for: indexPath) as! RecipeTableViewCell
        let recipe = viewModel.getRecipes()[indexPath.row]
        cell.setUp(recipe: recipe)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let viewModel else { return }
        tapHaptic()
        let recipe = viewModel.getRecipes()[indexPath.row]
        coordinator?.detalView(recipe: recipe)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
