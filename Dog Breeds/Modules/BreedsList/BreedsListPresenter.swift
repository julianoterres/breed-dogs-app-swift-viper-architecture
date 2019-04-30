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
    
    if let favorites = UserDefaults.standard.object(forKey: "favorites") as? [String], favorites.count > 0 {
      
      breedsSaved = breedsSaved.map { (breed) -> Breed in
        return Breed(
          name: breed.name.capitalizingFirstLetter(),
          slug: breed.slug,
          favorite: favorites.contains(breed.slug)
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
      
      if let favorites = UserDefaults.standard.object(forKey: "favorites") as? [String], favorites.contains(breed) {
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
