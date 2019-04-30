//
//  AppRouter.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import UIKit

class AppRouter {
  
  func buildMainScreen() -> UITabBarController {
    
    let breedsListNavigationController = UINavigationController()
    let breedsListViewController = BreedsListRouter().build()
    breedsListNavigationController.tabBarItem = UITabBarItem(title: "Breeds", image: UIImage(named: "icon_tab_breeds"), selectedImage: UIImage(named: "icon_tab_breeds"))
    breedsListNavigationController.viewControllers = [breedsListViewController]
    
    let favoritesListNavigationController = UINavigationController()
    let favoritesListViewController = FavoritesListRouter().build()
    favoritesListNavigationController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "icon_tab_favorites"), selectedImage: UIImage(named: "icon_tab_favorites"))
    favoritesListNavigationController.viewControllers = [favoritesListViewController]
    
    let tabBarController = UITabBarController()
    tabBarController.viewControllers = [breedsListNavigationController, favoritesListNavigationController]
    
    return tabBarController
    
  }
  
}
