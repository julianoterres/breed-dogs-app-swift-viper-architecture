//
//  UrlsApi.swift
//  Dog Breeds
//
//  Created by Juliano Terres on 29/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Foundation

class UrlsApi: UrlsApiProtocol {
  
  private let baseUlr = "https://hidden-crag-71735.herokuapp.com/"
  
  func breeds() -> URL {
    return URL(string: baseUlr + "api/breeds")!
  }
  
  func breedsImages(breedName: String) -> URL {
    return  URL(string: baseUlr + "api/" + breedName + "/images")!
  }
  
}
