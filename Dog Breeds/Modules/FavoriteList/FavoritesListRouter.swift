//
//  FavoritesListRouter.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of FavoritesListRouterProtocol
class FavoritesListRouter: FavoritesListRouterProtocol {
  
  weak var viewController: UIViewController?
  
  func build() -> UIViewController {
    
    let viewController = FavoritesListViewController()
    let presenter = FavoritesListPresenter()
    let router = FavoritesListRouter()
    
    viewController.presenter = presenter
    presenter.viewController = viewController
    presenter.router = router
    router.viewController = viewController
    
    return viewController
    
  }
  
}

// MARK: Methods of FavoritesListPresenterToRouterProtocol
extension FavoritesListRouter: FavoritesListPresenterToRouterProtocol {
  
  func goToListImages(favorite: Breed) {
    let imagesListViewController = ImagesListRouter().build(breed: favorite)
    viewController?.navigationController?.pushViewController(imagesListViewController, animated: true)
  }
  
}

