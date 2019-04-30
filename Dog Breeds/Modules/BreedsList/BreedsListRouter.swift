//
//  BreedsListRouter.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of BreedsListRouterProtocol
class BreedsListRouter: BreedsListRouterProtocol {
  
  weak var viewController: UIViewController?
  
  func build() -> UIViewController {
    
    let viewController = BreedsListViewController()
    let presenter = BreedsListPresenter()
    let service = BreedsListService()
    let router = BreedsListRouter()
    let network = Network()
    let urlsApi = UrlsApi()
    
    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.service = service
    presenter.router = router
    service.presenter = presenter
    service.network = network
    service.urlsApi = urlsApi
    router.viewController = viewController
    
    return viewController
    
  }
  
}

// MARK: Methods of BreedsListPresenterToRouterProtocol
extension BreedsListRouter: BreedsListPresenterToRouterProtocol {

  func goToListImages(breed: Breed) {
    let imagesListViewController = ImagesListRouter().build(breed: breed)
    viewController?.navigationController?.pushViewController(imagesListViewController, animated: true)
  }
  
}
