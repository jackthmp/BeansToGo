//
//  MeetingSubscription.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import Foundation

struct MeetingSubscription: Codable, Equatable {
  var title: String
  var dateTime: String
  var office: String
  
  static let dummySubscriptions: [MeetingSubscription] = [
    MeetingSubscription(title: "Yelp Weekly", dateTime: "Thurs, 11AM", office: "New Montgomery Office (8F)"),
    MeetingSubscription(title: "Yelp Weekly", dateTime: "Fri, 11AM", office: "New Montgomery Office (8F)"),
    MeetingSubscription(title: "Yelp Weekly", dateTime: "Fri, 3PM", office: "New Montgomery Office (8F)"),
    MeetingSubscription(title: "Product @ Yelp Weekly", dateTime: "Thurs, 4PM", office: "New Montgomery Office (8F)"),
    MeetingSubscription(title: "Product @ Yelp Weekly", dateTime: "Fri, 11AM", office: "New Montgomery Office (8F)"),
    MeetingSubscription(title: "Machine Learning Weekly", dateTime: "Thurs, 3:30PM", office: "New Montgomery Office (8F)"),
    MeetingSubscription(title: "Corp Infra Weekly", dateTime: "Fri, 3PM", office: "New Montgomery Office (8F)")
  ]
}
