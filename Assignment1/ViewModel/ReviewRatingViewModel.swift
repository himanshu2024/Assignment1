//
//  ReviewRatingViewModel.swift
//  Assignment1
//
//  Created by Himanshu Chaurasiya on 09/12/19.
//  Copyright © 2019 HPC. All rights reserved.
//

import Foundation

class ReviewRatingViewModel {
    var response : ReviewResponse?
    
    func fetchData(onCompletion : ()->Void) {
        let req = ReviewRequest()
        req.getJsonDataFromFile { result in
            switch(result)
            {
            case .failure(let error) :
                print(error)
            case .success(let response) :
                print("Success")
                self.response = response
                onCompletion()
            }
        }
    }
    
    func numberOfSection() -> Int {
        guard let res = response else {
            return 0
        }
        var x = res.data?.feedbackItems?.count ?? 0
        print("Number of feedback \(x)")
        x += 2
        return x
    }
    
    func numberOfRows(in section : ViewController.Section) -> Int {
        switch section {
        case .OrderItem:
            return response == nil ? 0 : 1
        case .Feedback:
            return response == nil ? 0 : response?.data?.feedbackItems?.count ?? 0
        default:
            return response == nil ? 0 : 1
        }
    }
    
}
