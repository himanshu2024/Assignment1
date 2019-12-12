//
//  ViewController.swift
//  Assignment1
//
//  Created by Himanshu Chaurasiya on 04/12/19.
//  Copyright © 2019 HPC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var response = ReviewResponse()
    let pageViewModel = ReviewRatingViewModel()
    
    enum Section : Int {
        case OrderItem = 0
        case Feedback
        case Other
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "OrderItemTableViewCell", bundle: nil), forCellReuseIdentifier: "OrderItemTableViewCell")
        tableView.register(UINib(nibName: "FeedbackTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedbackTableViewCell")
        
        pageViewModel.fetchData {
            //update List
            //print(pageViewModel.itemName)
            tableView.reloadData()
        }
        
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        pageViewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "OrderItemTableViewCell", for: indexPath) as! OrderItemTableViewCell
            cell.orderDetails = pageViewModel.response?.data?.basicInfo
            return cell
        }
        else if indexPath.section == (pageViewModel.numberOfSection() - 1){
            return UITableViewCell()
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackTableViewCell", for: indexPath) as! FeedbackTableViewCell
            cell.item = pageViewModel.response?.data?.feedbackItems?[indexPath.section - 1]
            cell.tableViewDelegete = self
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        //guard let section1 = section else {return CGFloat.leastNormalMagnitude}
        return  10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    
}

extension ViewController : RatingProtocol{
    func updateTable() {
        tableView.reloadData()
    }
    
    
}

