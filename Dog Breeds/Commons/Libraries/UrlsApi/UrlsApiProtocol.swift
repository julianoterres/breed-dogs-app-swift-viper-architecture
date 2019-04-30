//
//  UrlsApiProtocol.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

protocol UrlsApiProtocol: class {
  func breeds() -> URL
  func breedsImages(breedName: String) -> URL
}

