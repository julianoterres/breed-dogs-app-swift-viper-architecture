//
//  FavoritesListTableCell.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of FavoritesListTableCell
class FavoritesListTableCell: UITableViewCell {
  
  let favoriteNameLabel = UILabel()
  let separatorView = UIView()
  let buttonDelete = UIButton()
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  static let height = CGFloat(50)
  static let identifier = "FavoritesListCell"
  var favorite: Favorites!
  var row: Int!
  weak var view: FavoritesListViewController?
  
  func setup(favoriteSelected: Favorites, viewDelegate: FavoritesListViewController, rowTableCell: Int) {
    view = viewDelegate
    favorite = favoriteSelected
    row = rowTableCell
    favoriteNameLabel.text = favorite.name
    addElementsInScreen()
    selectionStyle = .none
  }
  
  func addElementsInScreen() {
    addBreedNameLabel()
    addButtonDelete()
    addCollectionView()
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
    buttonDelete.addConstraint(attribute: .centerY, alignElement: favoriteNameLabel, alignElementAttribute: .centerY, constant: 0)
    buttonDelete.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 50)
    buttonDelete.addConstraint(attribute: .width, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 50)
  }
  
  func addCollectionView() {
    contentView.addSubview(collectionView)
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    collectionView.delegate = view
    collectionView.dataSource = view
    collectionView.tag = row
    collectionView.collectionViewLayout = layout
    collectionView.backgroundColor = .white
    collectionView.register(FavoritesListCollectionCell.self, forCellWithReuseIdentifier: FavoritesListCollectionCell.identifier)
    collectionView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
    collectionView.addConstraint(attribute: .top, alignElement: favoriteNameLabel, alignElementAttribute: .bottom, constant: 20)
    collectionView.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    collectionView.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
    collectionView.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: (contentView.frame.width / 2) * 1.5)
    collectionView.reloadData()
  }
  
  func addLineSeparator() {
    contentView.addSubview(separatorView)
    separatorView.backgroundColor = .tableLineSeparator
    separatorView.addConstraint(attribute: .top, alignElement: collectionView, alignElementAttribute: .bottom, constant: 20)
    separatorView.addConstraint(attribute: .right, alignElement: contentView, alignElementAttribute: .right, constant: 20)
    separatorView.addConstraint(attribute: .left, alignElement: contentView, alignElementAttribute: .left, constant: 20)
    separatorView.addConstraint(attribute: .bottom, alignElement: contentView, alignElementAttribute: .bottom, constant: 0)
    separatorView.addConstraint(attribute: .height, alignElement: nil, alignElementAttribute: .notAnAttribute, constant: 1)
  }
  
  @objc func didPressDelete(button: UIButton) {
    view?.didPressDelete(favorite: favorite)
  }
  
}




