//
//  SampleData.swift
//  smartTrip
//
//  Created by Sharry Tong on 4/25/18.
//  Copyright © 2018 Sharry Tong. All rights reserved.
//

import Foundation

final class SampleData {
    static func generateTripsData() -> [Trip] {
        return[
            Trip(destination: "New York", depDate: "May 4, 2018", backDate: "May 7, 2018", bgImage:"default"),
            Trip(destination: "Miami", depDate:"May 1, 2018", backDate: "May 3, 2018", bgImage:"default")
            
        ]
    }
}
