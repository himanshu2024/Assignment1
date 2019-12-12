//
//  OrderItemTableViewCell.swift
//  Assignment1
//
//  Created by Himanshu Chaurasiya on 05/12/19.
//  Copyright © 2019 HPC. All rights reserved.
//

import UIKit

class OrderItemTableViewCell: UITableViewCell {
    @IBOutlet weak var orderImageView: UIImageView!
    @IBOutlet weak var orderNameLabel: UILabel!
    @IBOutlet weak var orderNumberLabel: UILabel!
    
    var orderDetails : BasicInfo?{
        didSet{
            if let data = orderDetails{
                orderNameLabel.text = data.itemsMessage
                orderImageView.load(url: URL(string: data.itemImages?.first ?? "")!)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        var height = self.layer.frame.height
        var width = self.layer.frame.width
        let shadowSize: CGFloat = 5
        let shadowDistance: CGFloat = 0
        let contactRect = CGRect(x: -shadowSize, y: height - (shadowSize+11), width: width + shadowSize * 2, height: shadowSize)
        self.layer.shadowPath = UIBezierPath(rect: contactRect).cgPath// UIBezierPath(ovalIn: contactRect).cgPath
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.7
        
        // Initialization code
        //self.layer.shadowOffset = .zero //CGSize(width: 1, height: 0.2)
//        self.layer.shadowOpacity = 0.2
//        self.layer.shadowRadius = 10.0
//        self.clipsToBounds = false
//        self.layer.masksToBounds = false
    }

    
}


 extension UIImageView {
     func load(url: URL) {
         DispatchQueue.global().async { [weak self] in
             if let data = try? Data(contentsOf: url) {
                 if let image = UIImage(data: data) {
                     DispatchQueue.main.async {
                         self?.image = image
                     }
                 }
             }
         }
     }
 }
