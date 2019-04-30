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
  var router: FavoritesListRouterProtocol?
  
}

// MARK: Methods of FavoritesListViewControllerToPresenterProtocol
extension FavoritesListPresenter: FavoritesListViewControllerToPresenterProtocol {
  
  func fetchFavorites() {
    
    if let favoritesSaved = UserDefaults.standard.object(forKey: "favorites") as? Data,
       let favorites = try? JSONDecoder().decode([Favorites].self, from: favoritesSaved),
       favorites.count > 0 {
      
      let favoritesList = favorites.sorted { $0.name < $1.name }
      viewController?.showFavorites(favoritesList: favoritesList)
      
    } else {
      viewController?.notFoundFavorites()
    }
    
  }
  
  func deleteFavorite(favorite: Favorites) {
    
    if let favoritesSaved = UserDefaults.standard.object(forKey: "favorites") as? Data,
       let favorites = try? JSONDecoder().decode([Favorites].self, from: favoritesSaved) {
      
      let newFavorites = favorites.filter({ $0.slug != favorite.slug })
    
      guard let newFavoritesEncoded = try? JSONEncoder().encode(newFavorites) else {
        return
      }
      
      UserDefaults.standard.set(newFavoritesEncoded, forKey: "favorites")
      
      let favoritesList = newFavorites.sorted { $0.name < $1.name }
      
      viewController?.showFavorites(favoritesList: favoritesList)
      
    }
    
  }
  
}
