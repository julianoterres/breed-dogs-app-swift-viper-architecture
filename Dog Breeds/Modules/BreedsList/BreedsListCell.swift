//
//  BreedsListCell.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of BreedsListCell
class BreedsListCell: UITableViewCell {
  
  let breedNameLabel = UILabel()
  let separatorView = UIView()
  let arrowImage = UIImageView()
  
  static let height = CGFloat(300)
  static let identifier = "BreedsListCell"
  
  func setup(breed: Breed) {
    breedNameLabel.text = breed.name
    addElementsInScreen()
    selectionStyle = .none
  }
  
  func addElementsInScreen() {
    addBreedNameLabel()
    addArrowImage()
    addLineSeparator()
  }
  
  func addBreedNameLabel() {
    contentView.addSubview(breedNameLabel)
    breedNameLabel.textColor = .black
    breedNameLabel.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 20)
    breedNameLabel.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    breedNameLabel.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
  }
  
  func addArrowImage() {
    contentView.addSubview(arrowImage)
    arrowImage.image = UIImage(named: "arrow_right")
    arrowImage.addConstraint(attribute: .centerY, alignElement: contentView, alignElementAttribute: .centerY, constant: 0)
    arrowImage.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    arrowImage.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 15)
    arrowImage.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 15)
  }
  
  func addLineSeparator() {
    contentView.addSubview(separatorView)
    separatorView.backgroundColor = .tableLineSeparator
    separatorView.addConstraint(attribute: .top, alignElement: breedNameLabel, alignElementAttribute: .bottom, constant: 20)
    separatorView.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    separatorView.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
    separatorView.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 0)
    separatorView.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 1)
  }
  
}

