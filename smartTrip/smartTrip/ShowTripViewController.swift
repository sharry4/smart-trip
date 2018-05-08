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
    @IBOutlet var destTF: UILabel!
    @IBOutlet var dateOne: UILabel!
    @IBOutlet var dateTwo: UILabel!
    
    var trip:Trip?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "ShowDays"{
            
            let showNotesByDayViewController = segue.destination as! ShowNotesByDayViewController
            showNotesByDayViewController.trip = trip
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM d, yyyy"
            
            let dayOne = dateFormatter.date(from: trip!.depDate!)
            let dayTwo = dateFormatter.date(from: trip!.backDate!)
            let diffInDays = Calendar.current.dateComponents([.day], from: dayOne!, to: dayTwo!).day
            
            let numberOfDays = diffInDays! + 1
            showNotesByDayViewController.numberOfDays = numberOfDays
            print(numberOfDays)
            
        }
    }

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
