//
//  EventTableViewController.swift
//  Event_Week3
//
//  Created by Cntt03 on 4/22/17.
//  Copyright © 2017 Cntt03. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    
    //get all event in day
    lazy var eventInDays: [EventInDay] = {
        return EventInDay.eventInDays()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = editButtonItem
        //tableView.estimatedRowHeight = tableView.rowHeight
        //tableView.rowHeight = UITableViewAutomaticDimension
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
        cell.configCellWith(event: event)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            // initialize new view controller and cast it as your view controller
            let viewController = segue.destination as! DetailEventViewController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                viewController.event = eventAtIndexPath(indexPath: indexPath as NSIndexPath)
            }
            
        }
    }
    
    // get event by indexPath
    func eventAtIndexPath(indexPath: NSIndexPath) -> Event{
        let eventInDay = eventInDays[indexPath.section];
        return eventInDay.events[indexPath.row];
        
    }
    
    //delete by swipe
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete){
            let eventInDay = eventInDays[indexPath.section];
            eventInDay.events.remove(at: indexPath.row)
            //update table view with new data source
            //tableView.reloadData() bad ways
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
        }
    }

    //sort 
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //get data in sourceIndexPath
        let eventInDay = eventInDays[sourceIndexPath.section];
        let event = eventInDay.events[sourceIndexPath.row];
        //remove data at souceIndex
        eventInDay.events.remove(at: sourceIndexPath.row)
        //get data in desIndexPath
        let eventInDayDes = eventInDays[destinationIndexPath.section];
        //update data
        eventInDayDes.events.insert(event, at: destinationIndexPath.row);
        
    }


}
