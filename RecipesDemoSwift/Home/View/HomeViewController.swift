//
//  HomeViewController.swift
//  RecipesDemoSwift
//
//  Created by Kevinho Morales on 1/1/24.
//

import UIKit

protocol HomeViewProtocol {
    func reloadData()
    func showLoading()
    func hideLoading()
}

final class HomeViewController: MainViewController, HomeViewProtocol {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
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
        let rockStarCell = UINib(nibName: String(describing: RockStarCollectionViewCell.self), bundle: .main)
        collectionView.register(rockStarCell, forCellWithReuseIdentifier: RockStarCollectionViewCell.CELL_ID)
        
        let recipeCell = UINib(nibName: String(describing: RecipeTableViewCell.self), bundle: .main)
        tableView.register(recipeCell, forCellReuseIdentifier: RecipeTableViewCell.CELL_ID)
    }
}

extension HomeViewController {
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.collectionView.reloadData()
        }
    }
    func showLoading() {
        Loading.show("CARGANDO")
    }
    func hideLoading() {
        Loading.hide()
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel else { return 0 }
        let recipes = Array(viewModel.getRecipes().suffix(4))
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RockStarCollectionViewCell.CELL_ID, for: indexPath) as! RockStarCollectionViewCell
        let recipes = Array(viewModel.getRecipes().suffix(4))
        let recipe = recipes[indexPath.row]
        cell.setUp(recipe: recipe)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel else { return }
        tapHaptic()
        let recipes = Array(viewModel.getRecipes().suffix(4))
        let recipe = recipes[indexPath.row]
        coordinator?.detalView(recipe: recipe)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let viewModel else { return }
        if searchText.isEmpty {
            viewModel.retrieveRecipes { [weak self] recipes in
                self?.reloadDataBySearch(recipes: recipes)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let viewModel else { return }
        guard let searchText = searchBar.text else { return }
        let recipes = viewModel.recipes.filter { $0.name.contains(searchText) }
        searchBar.endEditing(true)
        if searchText.isEmpty {
            viewModel.retrieveRecipes { [weak self] recipes in
                self?.reloadDataBySearch(recipes: recipes)
            }
            return
        }
        reloadDataBySearch(recipes: recipes)
    }
        
    private func reloadDataBySearch(recipes: [Recipe]) {
        guard var viewModel else { return }
        viewModel.recipes = recipes
        reloadData()
    }
}
