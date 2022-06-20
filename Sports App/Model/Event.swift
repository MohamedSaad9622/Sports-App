//
//  Event.swift
//  Sports App
//
//  Created by MAC on 20/06/2022.
//

import Foundation

struct Events: Codable {
    let events: [Event]
}

struct Event: Codable {
    let strEvent: String
    let dateEventLocal: String
    let strTimeLocal: String
}
