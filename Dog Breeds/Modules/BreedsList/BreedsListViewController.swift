//
//  BreedsListViewController.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

// MARK: Methods of BreedsListViewController
class BreedsListViewController: UIViewController {
  
  let tableView = UITableView()
  let loader = UIActivityIndicatorView()
  
  var presenter: BreedsListViewControllerToPresenterProtocol?
  var breeds: [Breed] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    addElementsInScreen()
    presenter?.fetchBreeds()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    presenter?.updaFavorites()
  }
  
  func setupView() {
    view.backgroundColor = .white
    title = "Breeds List"
    setupBackButton()
  }
  
  func addElementsInScreen() {
    addLoader()
    addTableView()
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
  
  func addTableView() {
    view.addSubview(tableView)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(BreedsListCell.self, forCellReuseIdentifier: BreedsListCell.identifier)
    tableView.estimatedRowHeight = BreedsListCell.height
    tableView.rowHeight = UITableView.automaticDimension
    tableView.separatorStyle = .none
    tableView.isHidden = true
    tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    tableView.addConstraint(attribute: .top, alignElement: view.safeAreaLayoutGuide, alignElementAttribute: .top, constant: 0)
    tableView.addConstraint(attribute: .right, alignElement: view, alignElementAttribute: .right, constant: 0)
    tableView.addConstraint(attribute: .left, alignElement: view, alignElementAttribute: .left, constant: 0)
    tableView.addConstraint(attribute: .bottom, alignElement: view, alignElementAttribute: .bottom, constant: 0)
  }
  
}

// MARK: Methods of BreedsListPresenterToViewControllerProtocol
extension BreedsListViewController: BreedsListPresenterToViewControllerProtocol {
  
  func showBreeds(breedsList: [Breed]) {
    breeds = breedsList
    tableView.reloadData()
    tableView.isHidden = false
  }
  
}

// MARK: Methods of UITableViewDelegate and UITableViewDataSource
extension BreedsListViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return breeds.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: BreedsListCell.identifier, for: indexPath) as? BreedsListCell {
      cell.setup(breed: breeds[indexPath.row])
      return cell
    }
    return UITableViewCell()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.goToListImages(breed: breeds[indexPath.row])
  }
  
}
