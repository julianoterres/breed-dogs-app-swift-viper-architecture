//
//  BreedsListService.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

// MARK: Methods of BreedsListService
class BreedsListService: BreedsListServiceProtocol {
  
  weak var presenter: BreedsListServiceToPresenterProtocol?
  var network: NetworkProtocol?
  var urlsApi: UrlsApi?
  
}

// MARK: Methods of BreedsListPresenterToService
extension BreedsListService: BreedsListPresenterToService {
  
  func fetchBreeds() {
    
    guard let url = urlsApi?.breeds() else { return }
    
    network?.request(url: url, method: .get, parameters: nil, success: { [weak self] (response) in
      
      do {
        let breeds = try JSONDecoder().decode([String].self, from: response)
        self?.presenter?.fetchedBreeds(breeds: breeds)
      } catch {
        self?.presenter?.fetchedBreedsFail(error: error.localizedDescription)
      }
      
      }, failure: { [weak self] (error) in
        self?.presenter?.fetchedBreedsFail(error: error)
    })
    
  }
  
}
