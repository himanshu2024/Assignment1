//
//  ReviewRequest.swift
//  Assignment1
//
//  Created by Himanshu Chaurasiya on 05/12/19.
//  Copyright © 2019 HPC. All rights reserved.
//

import Foundation

enum MyError : Error{
    case noDataAvailable
    case canNotProcessData
}

class ReviewRequest {
    func getJsonDataFromFile(completion : (Result<ReviewResponse, MyError>) -> Void) {
        if let path = Bundle.main.path(forResource: "Payload", ofType: "json") {
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let decoder = JSONDecoder()
                let model = try decoder.decode(ReviewResponse.self, from: data)
                completion(.success(model))
              } catch {
                completion(.failure(.canNotProcessData))
              }
        }
    }
    
}
