//
//  FavoritesListCollectionCell.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit
import Kingfisher

class FavoritesListCollectionCell: UICollectionViewCell {
  
  let imageBreed = UIImageView()
  
  static let height = CGFloat(50)
  static let identifier = "FavoritesListCollectionCell"
  var url: URL?
  
  func setup(urlImage: URL?) {
    url = urlImage
    addElementsInScreen()
  }
  
  func addElementsInScreen() {
    addImageBreed()
  }
  
  func addImageBreed() {
    contentView.addSubview(imageBreed)
    imageBreed.clipsToBounds = true
    imageBreed.contentMode = .scaleAspectFill
    imageBreed.kf.indicatorType = .activity
    imageBreed.kf.setImage(with: url)
    imageBreed.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 5)
    imageBreed.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 5)
    imageBreed.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 5)
    imageBreed.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 5)
  }
  
}

