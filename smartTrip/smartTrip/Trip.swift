//
//  trip.swift
//  smartTrip
//
//  Created by Sharry Tong on 4/25/18.
//  Copyright © 2018 Sharry Tong. All rights reserved.
//
import UIKit
import Foundation

struct Trip {
    var destination: String? //question mark means this can be nil/empty
    var depDate: String?
    var backDate: String?
    var bgImage: UIImage?
    var notes: [Note]
}


