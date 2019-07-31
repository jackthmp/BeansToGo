//
//  NetworkController.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import Foundation
import WebKit
import GoogleSignIn
import SwiftSoup


class NetworkController: NSObject, WKNavigationDelegate {
  
  static let apiUrl = URL(string: "https://yelp-beans.appspot.com/v1/user/")!
  
  // NOTE: Currently does not work with Yelp Beans API, only here as a placeholder for future usage.
  func loadUser(withCompletion completion: @escaping (User?) -> Void) {
    let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
    let url = NetworkController.apiUrl.appendingPathComponent("/v1/user/")
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in

      guard let data = data else {
        completion(nil)
        return
      }

      guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
        completion(nil)
        return
      }
      do {
        let jsonDecoder = JSONDecoder()
        let user = try jsonDecoder.decode(User.self, from: data)
        completion(user)
      } catch {
        completion(nil)
      }
    })
    task.resume()
  }
  
  static func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
   session.dataTask(with: url, completionHandler: completion).resume()
  }
  
  static func downloadImage(from url: URL, completion: @escaping (UIImage?) -> ()) {
    NetworkController.getData(from: url) { data, response, error in
      guard let data = data, error == nil else { return }
      print(response?.suggestedFilename ?? url.lastPathComponent)
      DispatchQueue.main.async() {
        completion(UIImage(data: data))
      }
    }
  }
}
