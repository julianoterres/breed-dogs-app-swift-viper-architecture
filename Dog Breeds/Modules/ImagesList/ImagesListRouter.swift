//
//  ImagesListRouter.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of BreedsListRouterProtocol
class ImagesListRouter: ImagesListRouterProtocol {
  
  func build(breed: Breed) -> UIViewController {
    
    let viewController = ImagesListViewController()
    let presenter = ImagesListPresenter()
    let service = ImagesListService()
    let network = Network()
    let urlsApi = UrlsApi()
    
    viewController.breed = breed
    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.service = service
    service.presenter = presenter
    service.network = network
    service.urlsApi = urlsApi
    
    return viewController
    
  }
  
}
