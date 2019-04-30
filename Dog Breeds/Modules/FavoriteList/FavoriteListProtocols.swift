//
//  FavoriteListProtocols.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of View to Presenter
protocol FavoritesListViewControllerToPresenterProtocol: class {
  func fetchFavorites()
  func deleteFavorite(favorite: Favorites)
}

// MARK: Methods of Cell To View
protocol FavoritesListCellToViewControllerProtocol: class {
  func didPressDelete(favorite: Favorites)
}

// MARK: Methods of View to Presenter Protocol
protocol FavoritesListPresenterProtocol: class {
  var viewController: FavoritesListPresenterToViewControllerProtocol? { get set}
  var router: FavoritesListRouterProtocol? { get set}
}

// MARK: Methods of Presenter To View
protocol FavoritesListPresenterToViewControllerProtocol: class {
  var presenter: FavoritesListViewControllerToPresenterProtocol? { get set }
  func showFavorites(favoritesList: [Favorites])
  func notFoundFavorites()
}

// MARK: Methods of FavoritesListRouterProtocol
protocol FavoritesListRouterProtocol: class {
  func build() -> UIViewController
}

