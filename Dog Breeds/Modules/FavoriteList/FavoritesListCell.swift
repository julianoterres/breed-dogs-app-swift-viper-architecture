//
//  FavoritesListCell.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of BreedsListCell
class FavoritesListCell: UITableViewCell {
  
  let favoriteNameLabel = UILabel()
  let separatorView = UIView()
  let buttonDelete = UIButton()
  
  static let height = CGFloat(50)
  static let identifier = "FavoritesListCell"
  var favorite: Breed!
  weak var view: FavoritesListCellToViewControllerProtocol?
  
  func setup(favoriteSelected: Breed, viewDelegate: FavoritesListCellToViewControllerProtocol) {
    view = viewDelegate
    favorite = favoriteSelected
    favoriteNameLabel.text = favorite.name
    addElementsInScreen()
    selectionStyle = .none
  }
  
  func addElementsInScreen() {
    addBreedNameLabel()
    addButtonDelete()
    addLineSeparator()
  }
  
  func addBreedNameLabel() {
    contentView.addSubview(favoriteNameLabel)
    favoriteNameLabel.textColor = .black
    favoriteNameLabel.addConstraint(attribute: .top, alignElement: contentView, alignElementAttribute: .top, constant: 20)
    favoriteNameLabel.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    favoriteNameLabel.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
  }
  
  func addButtonDelete() {
    contentView.addSubview(buttonDelete)
    buttonDelete.setImage(UIImage(named: "icon_trash"), for: .normal)
    buttonDelete.addTarget(self, action: #selector(didPressDelete(button:)), for: .touchUpInside)
    buttonDelete.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    buttonDelete.addConstraint(attribute: .centerY, alignElement: contentView, alignElementAttribute: .centerY, constant: 0)
    buttonDelete.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 50)
    buttonDelete.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 50)
  }
  
  func addLineSeparator() {
    contentView.addSubview(separatorView)
    separatorView.backgroundColor = .tableLineSeparator
    separatorView.addConstraint(attribute: .top, alignElement: favoriteNameLabel, alignElementAttribute: .bottom, constant: 20)
    separatorView.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    separatorView.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
    separatorView.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 0)
    separatorView.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 1)
  }
  
  @objc func didPressDelete(button: UIButton) {
    view?.didPressDelete(favorite: favorite)
  }
  
}


