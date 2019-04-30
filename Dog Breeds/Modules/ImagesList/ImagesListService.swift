//
//  ImagesListService.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of ImagesListService
class ImagesListService: ImagesListServiceProtocol {
  
  weak var presenter: ImagesListServiceToPresenterProtocol?
  var network: NetworkProtocol?
  var urlsApi: UrlsApi?
  
}

// MARK: Methods of ImagesListPresenterToService
extension ImagesListService: ImagesListPresenterToServiceProtocol {
  
  func fetchImages(breed: String) {
    
    guard let url = urlsApi?.breedsImages(breedName: breed) else { return }
    
    network?.request(url: url, method: .get, parameters: nil, success: { [weak self] (response) in
      
      do {
        let images = try JSONDecoder().decode([String].self, from: response)
        self?.presenter?.fetchedImages(images: images)
      } catch {
        self?.presenter?.fetchedImagesFail(error: error.localizedDescription)
      }
      
      }, failure: { [weak self] (error) in
        self?.presenter?.fetchedImagesFail(error: error)
    })
    
  }
  
}
