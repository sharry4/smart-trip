//
//  ShowTripViewController.swift
//  smartTrip
//
//  Created by CAROLINA DIAZ on 4/28/18.
//  Copyright © 2018 Sharry Tong. All rights reserved.
//

import UIKit

class ShowTripViewController: UITableViewController {
    
    @IBOutlet weak var destPhoto: UIImageView!
    @IBOutlet var destTF: UITextField!
    @IBOutlet var dateOne: UILabel!
    @IBOutlet var dateTwo: UILabel!
    
    var trip:Trip?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let destination = trip!.destination{
            destTF.text = destination
        }
        
       if let depDate = trip!.depDate{
          dateOne.text = depDate
        }
        
      if let backDate = trip!.backDate{
        dateTwo.text = backDate
        }
        
        if let bgImage = trip!.bgImage{
            destPhoto.image = bgImage
        }
       
        
        //  var destination: String? //question mark means this can be nil/empty
       // var depDate: String?
        //var backDate: String?
       // var bgImage: String?
      
    }

}
