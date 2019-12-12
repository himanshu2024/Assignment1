//
//  ReviewRatingResponse.swift
//  Assignment1
//
//  Created by Himanshu Chaurasiya on 05/12/19.
//  Copyright © 2019 HPC. All rights reserved.
//

import Foundation

// MARK: - Welcome
class ReviewResponse: Codable {
    var statusCode: Int?
    var statusMessage: String?
    var data: DataClass?

}

// MARK: - DataClass
class DataClass: Codable {
    var shipmentID: String?
    var noOfReviews: Int?
    var basicInfo: BasicInfo?
    var eventInfo: EventInfo?
    var customerKey, orderDate: String?
    var feedbackItems: [FeedbackItem]?
    var submittedAt: String?
    var isReviewed: Int?

    enum CodingKeys: String, CodingKey {
        case shipmentID = "shipment_id"
        case noOfReviews
        case basicInfo = "basic_info"
        case eventInfo = "event_info"
        case customerKey = "customer_key"
        case orderDate = "order_date"
        case feedbackItems, submittedAt
        case isReviewed = "is_reviewed"
    }

}

// MARK: - BasicInfo
class BasicInfo: Codable {
    var deliveryDate, deliveredDate: String?
    var hubID: Int?
    var itemList: [ItemList]?
    var itemImages: [String]?
    var itemsMessage, ratingTitle, phone, callCustomerCareText: String?
    var notDeliveredMessage, returnCallFromChc, returnCallRating, textQuestion: String?

    enum CodingKeys: String, CodingKey {
        case deliveryDate = "delivery_date"
        case deliveredDate = "delivered_date"
        case hubID = "hub_id"
        case itemList = "item_list"
        case itemImages = "item_images"
        case itemsMessage = "items_message"
        case ratingTitle = "rating_title"
        case phone
        case callCustomerCareText = "call_customer_care_text"
        case notDeliveredMessage = "not_delivered_message"
        case returnCallFromChc = "return_call_from_chc"
        case returnCallRating = "return_call_rating"
        case textQuestion
    }

}

// MARK: - ItemList
class ItemList: Codable {
    var productID, prName: String?

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case prName = "pr_name"
    }

}

// MARK: - EventInfo
class EventInfo: Codable {
    var split: Bool?
    var shipmentID, amount, deliveredDate, orderDate: String?
    var shipmentType: String?
    var discount: Double?
    var city, hub, customerType, categoryList: String?

    enum CodingKeys: String, CodingKey {
        case split
        case shipmentID = "shipment_id"
        case amount
        case deliveredDate = "delivered_date"
        case orderDate = "order_date"
        case shipmentType = "shipment_type"
        case discount, city, hub
        case customerType = "customer_type"
        case categoryList = "category_list"
    }

}

// MARK: - FeedbackItem
class FeedbackItem: Codable {
    var feedbackItemClass, feedbackID: String?
    var isMandatory: Bool?
    var classQuestion: String?
    var rateRange: Int?
    var feedbackType: String?
    var rateLevel: [FeedbackItemRateLevel]?
    var textQuestion: String?
    var productData: [ProductDatum]?

    enum CodingKeys: String, CodingKey {
        case feedbackItemClass = "class"
        case feedbackID = "feedback_id"
        case isMandatory = "is_mandatory"
        case classQuestion, rateRange, feedbackType, rateLevel, textQuestion
        case productData = "product_data"
    }

}

// MARK: - ProductDatum
class ProductDatum: Codable {
    var id: String?
    var cityID, hubID: Int?
    var productID, createdAt, createdID, parentVersionID: String?
    var rateLevel: [ProductDatumRateLevel]?
    var rateRange, status: Int?
    var textQuestion: String?
    var textRating: [Int]?
    var updatedAt, updatedID, version, prName: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case cityID = "city_id"
        case hubID = "hub_id"
        case productID = "product_id"
        case createdAt
        case createdID = "createdId"
        case parentVersionID = "parentVersionId"
        case rateLevel, rateRange, status, textQuestion, textRating, updatedAt
        case updatedID = "updatedId"
        case version
        case prName = "pr_name"
    }

}

// MARK: - ProductDatumRateLevel
class ProductDatumRateLevel: Codable {
    var id: String?
    var level: Int?
    var levelRateQuestion: [LevelRateQuestion]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case level, levelRateQuestion
    }

}

// MARK: - LevelRateQuestion
class LevelRateQuestion: Codable {
    var id, subClassQuestion: String?
    var attributes: [Attribute]?
    var dynamicOption: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case subClassQuestion, attributes, dynamicOption
    }

}

// MARK: - Attribute
class Attribute: Codable {
    var id, option, subClass: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case option, subClass
    }

}

// MARK: - FeedbackItemRateLevel
class FeedbackItemRateLevel: Codable {
    var id: String?
    var level, branchingFactor: Int?
    var levelRateQuestion: [LevelRateQuestion]?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case level, branchingFactor, levelRateQuestion
    }
}
