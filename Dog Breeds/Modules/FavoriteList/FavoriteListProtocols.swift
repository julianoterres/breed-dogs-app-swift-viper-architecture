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
  func deleteFavorite(favorite: Breed)
  func goToListImages(favorite: Breed)
}

// MARK: Methods of Cell To View
protocol FavoritesListCellToViewControllerProtocol: class {
  func didPressDelete(favorite: Breed)
}

// MARK: Methods of View to Presenter Protocol
protocol FavoritesListPresenterProtocol: class {
  var viewController: FavoritesListPresenterToViewControllerProtocol? { get set}
  var router: FavoritesListPresenterToRouterProtocol? { get set}
}

// MARK: Methods of Presenter To View
protocol FavoritesListPresenterToViewControllerProtocol: class {
  var presenter: FavoritesListViewControllerToPresenterProtocol? { get set }
  func showFavorites(favoritesList: [Breed])
  func notFoundFavorites()
}

// MARK: Methods of FavoritesListRouterProtocol
protocol FavoritesListRouterProtocol: class {
  func build() -> UIViewController
}

// MARK: Methods of Presenter to Router
protocol FavoritesListPresenterToRouterProtocol: class {
  func goToListImages(favorite: Breed)
}

