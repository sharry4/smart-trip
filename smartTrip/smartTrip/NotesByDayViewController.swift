//
//  NotesByDayViewController.swift
//  smartTrip
//
//  Created by Sharry Tong on 4/26/18.
//  Copyright © 2018 Sharry Tong. All rights reserved.
//

import UIKit

protocol NoteDelegate {
    func saveTripsInNotesByDay(trip: Trip)
}

class NotesByDayViewController: UITableViewController {
    
  
    var numberOfDays:Int = 0
    var cellLabels:[String] = []
    
    var trip: Trip?
    var note: Note?
    
    var noteDelegate: NoteDelegate?
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        if segue.identifier == "DaySelect"{
//            for i in 1...numberOfDays {
//
//                note = Note(activity: "", food: "", more: "")
//
//                trip?.notes.append(note!)
//                
////                trip?.notes[i].activity = ""
////                trip?.notes[i].food = ""
////                trip?.notes[i].more = ""
//
//
//            }
//
//        }
//
//        print("trip:", trip)
//    }
    
    @IBAction func cancelToNotesByDayViewController(segue: UIStoryboardSegue) {
    }
    
    @IBAction func saveNotes(segue: UIStoryboardSegue) {
        guard let noteDetailViewController = segue.source as? NoteDetailViewController,
            let note = noteDetailViewController.note else { return }
        
        if let indexPath = self.tableView.indexPathForSelectedRow{
            trip!.notes[indexPath.row] = note
        }
        
        noteDelegate?.saveTripsInNotesByDay(trip: trip!)
        print("call saveTripsInNotesByDay in NotesVC")
        print("trip notes:", trip!.notes)
        
        let tripDetailsViewController = segue.destination as? TripDetailsViewController
        
        tripDetailsViewController?.tripNotes = trip!.notes
        


    }
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numberOfDays
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath)

        // Configure the cell...
        
        for i in 1...numberOfDays {
            let text = "Day " + String(i)
            cellLabels.append(text)
            cell.textLabel?.text = cellLabels[indexPath.row]
        }
       
        
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
