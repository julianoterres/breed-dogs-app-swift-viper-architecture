//
//  FavoritesListViewController.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of FavoritesListViewController
class FavoritesListViewController: UIViewController {
  
  let tableView = UITableView()
  let loader = UIActivityIndicatorView()
  let notFoundLabel = UILabel()
  
  var presenter: FavoritesListViewControllerToPresenterProtocol?
  var favorites: [Breed] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    presenter?.fetchFavorites()
  }
  
  func setupView() {
    view.backgroundColor = .white
    title = "Favorites List"
    setupBackButton()
  }
  
  func addElementsInScreen() {
    addLoader()
    addTableView()
    addNotFoundLabel()
  }
  
  func addLoader() {
    view.addSubview(loader)
    loader.color = .black
    loader.startAnimating()
    loader.hidesWhenStopped = true
    loader.addConstraint(attribute: .centerX, alignElement: view, alignElementAttribute: .centerX, constant: 0)
    loader.addConstraint(attribute: .centerY, alignElement: view, alignElementAttribute: .centerY, constant: 0)
    loader.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
    loader.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
  }
  
  func addTableView() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(FavoritesListCell.self, forCellReuseIdentifier: FavoritesListCell.identifier)
    tableView.estimatedRowHeight = FavoritesListCell.height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorStyle = .none
    tableView.isHidden = true
    tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    tableView.addConstraint(attribute: .top, alignElement: view.safeAreaLayoutGuide, alignElementAttribute: .top, constant: 0)
    tableView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    tableView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    tableView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
  }
  
  func addNotFoundLabel() {
    view.addSubview(notFoundLabel)
    notFoundLabel.text = "No favorites found"
    notFoundLabel.textAlignment = .center
    notFoundLabel.isHidden = true
    notFoundLabel.addConstraint(attribute: .top, alignElement: view.safeAreaLayoutGuide, alignElementAttribute: .top, constant: 20)
    notFoundLabel.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    notFoundLabel.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
  }
  
}

// MARK: Methods of FavoritesListPresenterToViewControllerProtocol
extension FavoritesListViewController: FavoritesListPresenterToViewControllerProtocol {
  
  func showFavorites(favoritesList: [Breed]) {
    favorites = favoritesList
    tableView.reloadData()
    tableView.isHidden = false
  }
  
  func notFoundFavorites() {
    notFoundLabel.isHidden = false
    loader.stopAnimating()
  }
  
}

// MARK: Methods of FavoritesListCellToViewControllerProtocol
extension FavoritesListViewController: FavoritesListCellToViewControllerProtocol {
  
  func didPressDelete(favorite: Breed) {
    presenter?.deleteFavorite(favorite: favorite)
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension FavoritesListViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return favorites.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: FavoritesListCell.identifier, for: indexPath) as? FavoritesListCell {
      cell.setup(favoriteSelected: favorites[indexPath.row], viewDelegate: self)
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.goToListImages(favorite: favorites[indexPath.row])
  }
  
}

