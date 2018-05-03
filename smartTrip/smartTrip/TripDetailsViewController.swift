//
//  TripDetailsViewController.swift
//  smartTrip
//
//  Created by Sharry Tong on 4/25/18.
//  Copyright © 2018 Sharry Tong. All rights reserved.
//

import UIKit

class TripDetailsViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  
    @IBAction func importImage(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //after complete
            
        }
    }
    
    
    @IBOutlet weak var destPhoto: UIImageView!
    
    @IBOutlet weak var destTF: UITextField!
    @IBOutlet weak var leaveDate: UIDatePicker!
    @IBOutlet weak var retDate: UIDatePicker!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            destPhoto.image = image
        } else
        {
            //error
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        print("init TripDetailsViewController")
        super.init(coder: aDecoder)
    }

    deinit {
        print("deinit TripDetailsViewController")
    }


    
    var trip: Trip?
    var note: Note?
    var tripNotes: [Note] = [Note(activity: "", food: "", more: "")]
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tripName = destTF.text
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        let leaveDay = dateFormatter.string(from: leaveDate.date)
        let returnDay = dateFormatter.string(from: retDate.date)
        let bgImage = destPhoto.image
        
        
        trip = Trip(destination: tripName, depDate: leaveDay, backDate: returnDay, bgImage: bgImage, notes:tripNotes)
        
        
        
        
        
//        if segue.identifier == "saveTripDetail" {
//            let notesByDayViewController = segue.source as? NotesByDayViewController
//            if trip != nil {
//
//
//            }
//            
//          print("trip save:", trip)
            
//        }
        
        if segue.identifier == "PickDay"{
            
            
            let dayOne = leaveDate.date
            let dayTwo = retDate.date
            
            let notesByDayViewController = segue.destination as! NotesByDayViewController
            let diffInDays = Calendar.current.dateComponents([.day], from: dayOne, to: dayTwo).day
            let numberOfDays = diffInDays! + 2
            notesByDayViewController.numberOfDays = numberOfDays
            print(numberOfDays)
            
            // prepare place holder for notes array
            for i in 1...(numberOfDays - 1) {
                note = Note(activity: "", food: "", more: "")
                trip?.notes.append(note!)
            }
            
            notesByDayViewController.trip = trip
            print("trip:", trip)
        }
        
        
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
      /*

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

// MARK: - IBActions
extension TripDetailsViewController {
    
    @IBAction func unwindWithSelectedDate(segue: UIStoryboardSegue){
        
        let notesByDayViewController = segue.source as? NotesByDayViewController
        tripNotes = notesByDayViewController!.trip!.notes
        
        print("saved trip:", trip)
    }
}



// MARK: - UITableViewDelegate
extension TripDetailsViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            destTF.becomeFirstResponder()
        }
    }
}




