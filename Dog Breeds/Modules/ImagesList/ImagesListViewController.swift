//
//  ImagesListViewController.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of ImagesListViewController
class ImagesListViewController: UIViewController {
  
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  let loader = UIActivityIndicatorView()
  var barButtonFavorite: UIBarButtonItem!
  
  var presenter: ImagesListViewControllerToPresenterProtocol?
  var images: [URL] = []
  var breed: Breed!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
    addButtonFavorite()
    presenter?.fetchImages(breed: breed.slug)
  }
  
  @objc func didPressFavorite() {
    presenter?.saveFavorite(breed: breed.slug)
  }
  
  func setupView() {
    view.backgroundColor = .white
    title = breed.name + " Images"
  }
  
  func addButtonFavorite() {
    barButtonFavorite = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(didPressFavorite))
    navigationItem.rightBarButtonItem = barButtonFavorite
    setupButtonFavorite(isFavorite: breed.favorite)
  }
  
  func setupButtonFavorite(isFavorite: Bool) {
    let imageName = (isFavorite) ? "icon_favorite_chek" : "icon_favorite_unchek"
    barButtonFavorite.image = UIImage(named: imageName)
  }
  
  func addElementsInScreen() {
    addLoader()
    addCollectionView()
  }
  
  func addLoader() {
    view.addSubview(loader)
    loader.color = .black
    loader.startAnimating()
    loader.addConstraint(attribute: .centerX, alignElement: view, alignElementAttribute: .centerX, constant: 0)
    loader.addConstraint(attribute: .centerY, alignElement: view, alignElementAttribute: .centerY, constant: 0)
    loader.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
    loader.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 20)
    
  }
  
  func addCollectionView() {
    view.addSubview(collectionView)
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.collectionViewLayout = layout
    collectionView.backgroundColor = .white
    collectionView.register(ImagesListCell.self, forCellWithReuseIdentifier: ImagesListCell.identifier)
    collectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    collectionView.isHidden = true
    collectionView.addConstraint(attribute: .top, alignElement: view, alignElementAttribute: .top, constant: 0)
    collectionView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    collectionView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    collectionView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
  }
  
}

// MARK: Methods of ImagesListPresenterToViewControllerProtocol
extension ImagesListViewController: ImagesListPresenterToViewControllerProtocol {
  
  func showImages(imagesList: [URL]) {
    images = imagesList
    collectionView.reloadData()
    collectionView.isHidden = false
  }
  
  func successSaveFavorite(){
    setupButtonFavorite(isFavorite: true)
  }

}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension ImagesListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImagesListCell.identifier, for: indexPath) as? ImagesListCell {
      cell.setup(urlImage: images[indexPath.row])
      return cell
    }
    return UICollectionViewCell()
  }
  
}

// MARK: Methods of UICollectionViewDelegateFlowLayout
extension ImagesListViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = ((self.collectionView.frame.width / 2) - self.collectionView.contentInset.left)
    let height = (width * 1.5)
    return CGSize(width: width, height: height)
  }
  
}
