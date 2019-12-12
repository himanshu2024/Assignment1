//
//  FeedbackTableViewCell.swift
//  Assignment1
//
//  Created by Himanshu Chaurasiya on 11/12/19.
//  Copyright © 2019 HPC. All rights reserved.
//

import UIKit
import Cosmos

class FeedbackTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var typeCollectionView: UICollectionView!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var bottomStackView: UIStackView!
    var tableViewDelegete : RatingProtocol?
    
    var item : FeedbackItem?{
        didSet{
            if let feedback = item{
                TitleLabel.text = feedback.classQuestion
                switch feedback.feedbackType {
                case .question_with_text:
                    typeCollectionView.isHidden = true
                case .dynamic:
                    typeCollectionView.isHidden = false
                default:
                    print("Default")
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ratingView.didFinishTouchingCosmos = {rating
            in
            print("Rate is = \(rating)")
            self.suggestionLabel.isHidden = false
            self.bottomStackView.isHidden = false
            //self.ratingView.rating = rating
            self.tableViewDelegete?.updateTable()
        }
    }

}
