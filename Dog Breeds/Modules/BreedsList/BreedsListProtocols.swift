//
//  BreedsListProtocols.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of View to Presenter
protocol BreedsListViewControllerToPresenterProtocol: class {
  func fetchBreeds()
  func updaFavorites()
  func goToListImages(breed: Breed)
}

// MARK: Methods of View to Presenter Protocol
protocol BreedsListPresenterProtocol: class {
  var viewController: BreedsListPresenterToViewControllerProtocol? { get set}
  var service: BreedsListPresenterToService? { get set}
  var router: BreedsListPresenterToRouterProtocol? { get set}
}

// MARK: Methods of Presenter To View
protocol BreedsListPresenterToViewControllerProtocol: class {
  var presenter: BreedsListViewControllerToPresenterProtocol? { get set }
  func showBreeds(breedsList: [Breed])
}

// MARK: Methods of Presenter To Service
protocol BreedsListPresenterToService: class {
  func fetchBreeds()
}

// MARK: Methods of Service
protocol BreedsListServiceProtocol: class {
  var presenter: BreedsListServiceToPresenterProtocol? { get set}
  var network: NetworkProtocol? { get set}
  var urlsApi: UrlsApi? { get set}
}

// MARK: Methods of Service to Presenter
protocol BreedsListServiceToPresenterProtocol: class {
  func fetchedBreeds(breeds: [String])
  func fetchedBreedsFail(error: String)
}

// MARK: Methods of BreedsListRouterProtocol
protocol BreedsListRouterProtocol: class {
  func build() -> UIViewController
}

// MARK: Methods of Presenter to Router
protocol BreedsListPresenterToRouterProtocol: class {
  func goToListImages(breed: Breed)
}
