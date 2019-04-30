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
  
  func saveFavorite(breed: String) {
    
    guard var favorites = UserDefaults.standard.object(forKey: "favorites") as? [String] else {
      UserDefaults.standard.set([breed], forKey: "favorites")
      viewController?.successSaveFavorite()
      return
    }
    
    if favorites.contains(breed) == false {
      favorites.append(breed)
      UserDefaults.standard.set(favorites, forKey: "favorites")
      viewController?.successSaveFavorite()
    }
    
  }
  
}

// MARK: Methods of ImagesListServiceToPresenterProtocol
extension ImagesListPresenter: ImagesListServiceToPresenterProtocol {
  
  func fetchedImages(images: [String]) {
    
    let imagesList = images.map { (image) -> URL in
      return URL(string: image)!
    }
    
    viewController?.showImages(imagesList: imagesList)
    
  }
  
  func fetchedImagesFail(error: String) {
    
  }
  
}
