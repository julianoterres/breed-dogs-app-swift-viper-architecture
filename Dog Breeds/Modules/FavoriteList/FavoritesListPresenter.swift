//
//  FavoritesListPresenter.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of FavoritesListPresenterProtocol
class FavoritesListPresenter: FavoritesListPresenterProtocol {
  
  weak var viewController: FavoritesListPresenterToViewControllerProtocol?
  var router: FavoritesListPresenterToRouterProtocol?
  
}

// MARK: Methods of FavoritesListViewControllerToPresenterProtocol
extension FavoritesListPresenter: FavoritesListViewControllerToPresenterProtocol {
  
  func fetchFavorites() {
    
    if let favorites = UserDefaults.standard.object(forKey: "favorites") as? [String], favorites.count > 0 {
      
      let favoritesList = favorites.map { (breed) -> Breed in
        return Breed(
          name: breed.capitalizingFirstLetter(),
          slug: breed,
          favorite: true
        )
      }.sorted { $0.name < $1.name }
      
      viewController?.showFavorites(favoritesList: favoritesList)
      
    } else {
      viewController?.notFoundFavorites()
    }
    
  }
  
  func deleteFavorite(favorite: Breed) {
    
    if let favorites = UserDefaults.standard.object(forKey: "favorites") as? [String] {
      
      let newFavorites = favorites.filter({ $0 != favorite.slug })
      
      UserDefaults.standard.set(newFavorites, forKey: "favorites")
      
      let favoritesList = newFavorites.map { (breed) -> Breed in
        return Breed(
          name: breed.capitalizingFirstLetter(),
          slug: breed,
          favorite: true
        )
        }.sorted { $0.name < $1.name }
      
      viewController?.showFavorites(favoritesList: favoritesList)
      
    }
    
  }
  
  func goToListImages(favorite: Breed) {
    router?.goToListImages(favorite: favorite)
  }
  
}
