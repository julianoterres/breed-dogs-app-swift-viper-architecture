//
//  BreedsListPresenter.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of BreedsListPresenter
class BreedsListPresenter: BreedsListPresenterProtocol {
  
  weak var viewController: BreedsListPresenterToViewControllerProtocol?
  var service: BreedsListPresenterToService?
  var router: BreedsListPresenterToRouterProtocol?
  var breedsSaved: [Breed] = []
  
}

// MARK: Methods of BreedsListViewControllerToPresenterProtocol
extension BreedsListPresenter: BreedsListViewControllerToPresenterProtocol {
  
  func fetchBreeds() {
    service?.fetchBreeds()
  }
  
  func updaFavorites() {
    
    if let favoritesSaved = UserDefaults.standard.object(forKey: "favorites") as? Data,
       let favorites = try? JSONDecoder().decode([Favorites].self, from: favoritesSaved),
       favorites.count > 0 {
    
      breedsSaved = breedsSaved.map { (breed) -> Breed in
        return Breed(
          name: breed.name.capitalizingFirstLetter(),
          slug: breed.slug,
          favorite: !favorites.filter({ $0.slug == breed.slug }).isEmpty
        )
      }
      
      viewController?.showBreeds(breedsList: breedsSaved)
      
    }
    
  }
  
  func goToListImages(breed: Breed) {
    router?.goToListImages(breed: breed)
  }
  
}

// MARK: Methods of BreedsListServiceToPresenterProtocol
extension BreedsListPresenter: BreedsListServiceToPresenterProtocol {
  
  func fetchedBreeds(breeds: [String]) {
    
    breedsSaved = breeds.map { (breed) -> Breed in
      
      var isFavorite = false
      
      if let favoritesSaved = UserDefaults.standard.object(forKey: "favorites") as? Data,
         let favorites = try? JSONDecoder().decode([Favorites].self, from: favoritesSaved),
         !favorites.filter({ $0.slug == breed }).isEmpty {
        isFavorite = true
      }
      
      return Breed(
        name: breed.capitalizingFirstLetter(),
        slug: breed,
        favorite: isFavorite
      )
      
    }
    
    viewController?.showBreeds(breedsList: breedsSaved)
  }
  
  func fetchedBreedsFail(error: String) {
    
  }
  
}
