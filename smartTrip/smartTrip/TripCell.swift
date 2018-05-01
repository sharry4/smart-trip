//
//  TripCell.swift
//  smartTrip
//
//  Created by Sharry Tong on 4/25/18.
//  Copyright © 2018 Sharry Tong. All rights reserved.
//

import UIKit

class TripCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    // MARK: - Properties
    var trip: Trip? {
        didSet {
            guard let trip = trip else { return }
            
            destinationLabel.text = trip.destination
            durationLabel.text = trip.depDate! + " - " + trip.backDate!
            tripImageView.image = trip.bgImage
        }
    }
    
    func image(forBackground trip: String) -> UIImage? {
        let imageName = "default"
        return UIImage(named: imageName)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
