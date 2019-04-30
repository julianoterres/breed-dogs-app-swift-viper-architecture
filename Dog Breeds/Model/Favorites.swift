//
//  Favorites.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

struct Favorites: Codable {
  let name: String
  let slug: String
  let images: [URL]
}
