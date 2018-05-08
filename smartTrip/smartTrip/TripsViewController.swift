//
//  TripsViewController.swift
//  smartTrip
//
//  Created by Sharry Tong on 4/25/18.
//  Copyright © 2018 Sharry Tong. All rights reserved.
//

import UIKit

class TripsViewController: UITableViewController {
    
    var tripList = SampleData.generateTripsData()
    var curTrip:Trip?
    
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowTripSegue"{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let showTripViewController = segue.destination as! ShowTripViewController
//                 let tripDetailsViewController = segue.destination as! TripDetailsViewController
                curTrip = tripList[indexPath.row]
                print("curTrip", curTrip)
                showTripViewController.trip = curTrip
//                tripDetailsViewController.curTrip = curTrip

            }
        }
    }
    
    @IBAction func cancelToTripsViewController(segue: UIStoryboardSegue) {
    }

    @IBAction func saveTripDetail(_ segue: UIStoryboardSegue) {
        
        guard let tripDetailsViewController = segue.source as? TripDetailsViewController,
            let trip = tripDetailsViewController.trip else { return }
        
        
        
        // add the new trip to the tripList array
        tripList.insert(trip,  at: 0)
        
        // update the tableView
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        print("tripList:", tripList)
    }
    

    


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tripList.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripCell

        // Configure the cell...
        let trip = tripList[indexPath.row]
        cell.trip = trip

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
