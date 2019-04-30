//
//  ImagesListPresenter.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of ImagesListPresenter
class ImagesListPresenter: ImagesListPresenterProtocol {
  
  weak var viewController: ImagesListPresenterToViewControllerProtocol?
  var service: ImagesListPresenterToServiceProtocol?
  
}

// MARK: Methods of ImagesListViewControllerToPresenterProtocol
extension ImagesListPresenter: ImagesListViewControllerToPresenterProtocol {
  
  func fetchImages(breed: String) {
    service?.fetchImages(breed: breed)
  }
  
  func saveFavorite(breed: String, images: [URL]) {
    
    let favorite = Favorites(
      name: breed.capitalizingFirstLetter(),
      slug: breed,
      images: Array(images.prefix(5))
    )
    
    if let favoritesSaved = UserDefaults.standard.object(forKey: "favorites") as? Data,
       var favorites = try? JSONDecoder().decode([Favorites].self, from: favoritesSaved) {
      
      if favorites.filter({ $0.slug == breed }).isEmpty {
        favorites.append(favorite)
        
        guard let favoritesEncoded = try? JSONEncoder().encode(favorites) else {
          return
        }
        
        UserDefaults.standard.set(favoritesEncoded, forKey: "favorites")
        viewController?.successSaveFavorite()
        
      }
      
      return
    }
    
    if let favoriteEncoded = try? JSONEncoder().encode([favorite]) {
      UserDefaults.standard.set(favoriteEncoded, forKey: "favorites")
      viewController?.successSaveFavorite()
    }
    
  }
  
}

// MARK: Methods of ImagesListServiceToPresenterProtocol
extension ImagesListPresenter: ImagesListServiceToPresenterProtocol {
  
  func fetchedImages(images: [String]) {
    
    let imagesList = images.map { (image) -> URL in
      
      let url = image.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
      
      return URL(string: url)!
      
    }
    
    viewController?.showImages(imagesList: imagesList)
    
  }
  
  func fetchedImagesFail(error: String) {
    
  }
  
}
