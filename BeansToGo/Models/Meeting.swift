//
//  Meeting.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/26/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import Foundation

struct Meeting: Codable {
  
  var dateTime: String
  var subscription: MeetingSubscription
  var participants: [User]
  
  static let dummyMeetings = [
    Meeting(dateTime: "Thurs, 11AM", subscription: MeetingSubscription.dummySubscriptions[0], participants: [User.testUser, User.testUser2]),
    Meeting(dateTime: "Fri, 11AM", subscription: MeetingSubscription.dummySubscriptions[1], participants: [User.testUser]),
    Meeting(dateTime: "Thurs, 4PM", subscription: MeetingSubscription.dummySubscriptions[3], participants: []),
    Meeting(dateTime: "Fri, 3PM", subscription: MeetingSubscription.dummySubscriptions[6], participants: [User.testUser, User.testUser3])
  ]
}
