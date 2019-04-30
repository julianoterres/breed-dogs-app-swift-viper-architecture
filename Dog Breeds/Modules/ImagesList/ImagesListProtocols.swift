//
//  ImagesListProtocols.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of View to Presenter
protocol ImagesListViewControllerToPresenterProtocol: class {
  func fetchImages(breed: String)
  func saveFavorite(breed: String)
}

// MARK: Methods of Presenter
protocol ImagesListPresenterProtocol: class {
  var viewController: ImagesListPresenterToViewControllerProtocol? { get set }
  var service: ImagesListPresenterToServiceProtocol? { get set }
}

// MARK: Methods of Presenter To View
protocol ImagesListPresenterToViewControllerProtocol: class {
  var presenter: ImagesListViewControllerToPresenterProtocol? { get set }
  func showImages(imagesList: [URL])
  func successSaveFavorite()
}

// MARK: Methods of Presenter To Service
protocol ImagesListPresenterToServiceProtocol: class {
  func fetchImages(breed: String)
}

// MARK: Methods of Service
protocol ImagesListServiceProtocol: class {
  var presenter: ImagesListServiceToPresenterProtocol? { get set }
  var network: NetworkProtocol? { get set }
  var urlsApi: UrlsApi? { get set }
}

// MARK: Methods of Service to Presenter
protocol ImagesListServiceToPresenterProtocol: class {
  func fetchedImages(images: [String])
  func fetchedImagesFail(error: String)
}

// MARK: Methods of ImagesListRouterProtocol
protocol ImagesListRouterProtocol: class {
  func build(breed: Breed) -> UIViewController
}
