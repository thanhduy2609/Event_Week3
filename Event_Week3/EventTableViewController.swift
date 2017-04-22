//
//  EventTableViewController.swift
//  Event_Week3
//
//  Created by Cntt03 on 4/22/17.
//  Copyright © 2017 Cntt03. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    var valueTitleToPass: String = ""
    var valueDesToPass: String = ""
    var valueAddressToPass: String = ""
    
    //get all event in day
    var eventInDays :[EventInDay]{
        return EventInDay.eventInDays()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //get number of section (7)
        return eventInDays.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //get number of event in day
        let event = eventInDays[section];
        return event.events.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let event = eventInDays[section];
        return event.day;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell

        // Configure the cell...
        //get event in day by section
        let eventInDay = eventInDays[indexPath.section];
        //get event by row
        let event = eventInDay.events[indexPath.row];
        cell.lblTitle?.text = event.title
        cell.lblDescription?.text = event.description
        cell.lblAddress?.text = event.address
        return cell
    }
    
    //xảy ra khi click vào 1 item
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow;
        let currentCell = tableView.cellForRow(at: indexPath!) as! EventCell
        
    
        valueDesToPass = String((currentCell.lblDescription?.text)!)
        valueTitleToPass = (currentCell.lblTitle?.text)!
        valueAddressToPass = (currentCell.lblAddress?.text)!
        
       // prepareForSegue(segue: , sender: <#T##AnyObject?#>)
        //performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if (segue.identifier == "showDetail") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! DetailEventViewController
            // your new view controller should have property that will store passed value
            viewController.lblAddress?.text = "HAHA"
            viewController.lblDes?.text = valueAddressToPass
            viewController.lblTitle?.text = valueTitleToPass
        }
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
