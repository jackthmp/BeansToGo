//
//  User.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import Foundation

struct User: Codable {
  var email: String
  var firstName: String
  var lastName: String
  var team: String?
  var role: String
  var photoURL: String
  var subscriptionPreferences: [MeetingSubscription]
  
  static var testUser: User = User(email: "jeremy@yelp.com", firstName: "Jeremy", lastName: "Stoppelman", team: "Executive Office", role: "Chief Executive Officer", photoURL: "http://leveleleven.com/wp-content/uploads/2014/10/speaker-jeremy_s-250.jpg", subscriptionPreferences: [MeetingSubscription.dummySubscriptions[0], MeetingSubscription.dummySubscriptions[1], MeetingSubscription.dummySubscriptions[4], MeetingSubscription.dummySubscriptions[6]])
  
  static var testUser2: User = User(email: "zallen@yelp.com", firstName: "Zoe", lastName: "Allen", team: nil, role: "Engineering Intern", photoURL: "https://pbs.twimg.com/profile_images/1003666894228893696/MJKlXdq2_400x400.jpg", subscriptionPreferences: [])
  
  static var testUser3: User = User(email: "jackt@yelp.com", firstName: "Jack", lastName: "Thompson", team: "Engineering - Reader Experience", role: "Engineering Intern", photoURL: "https://s3-media3.fl.yelpcdn.com/photo/0WH5cEHCDQxlJZdkNH1I5g/o.jpg", subscriptionPreferences: [])
}


