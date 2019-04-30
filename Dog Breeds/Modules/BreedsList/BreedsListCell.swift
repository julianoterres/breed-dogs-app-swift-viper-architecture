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
  
  static let height = CGFloat(50)
  static let identifier = "BreedsListCell"
  
  func setup(breed: Breed) {
    breedNameLabel.text = breed.name
    addElementsInScreen()
    selectionStyle = .none
  }
  
  func addElementsInScreen() {
    addBreedNameLabel()
    addLineSeparator()
  }
  
  func addBreedNameLabel() {
    contentView.addSubview(breedNameLabel)
    breedNameLabel.textColor = .black
    breedNameLabel.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 0)
    breedNameLabel.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    breedNameLabel.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
  }
  
  func addLineSeparator() {
    contentView.addSubview(separatorView)
    separatorView.backgroundColor = .tableLineSeparator
    separatorView.addConstraint(attribute: .top, alignElement: breedNameLabel, alignElementAttribute: .bottom, constant: 20)
    separatorView.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    separatorView.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
    separatorView.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 20)
    separatorView.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 1)
  }
  
}

