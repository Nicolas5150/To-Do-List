//
//  FirstViewController.swift
//  To Do List
//
//  Created by Nicolas Emery on 8/4/15.
//  Copyright © 2015 Nicolas Emery. All rights reserved.
//
import UIKit

// defining a global array of string vaeiable
var toDoList = [String]();

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var toDoListTable: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // load any previous items in the array list
        // check to see if an array of stored data has been created before or if the list is empty
        if (NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil)
        {
          // if not preload the stored array list
          toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String];
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // return the size of the array
       return toDoList.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    @available(iOS 2.0, *)
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        // gives us 0 to n row value
        cell.textLabel?.text = toDoList[indexPath.row]
        // giving strings to array list
        return cell;
    }
    
    // whenever an edit is trying to be made in the table (deleting of an item) this func is called
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        // when a swipe to the left is made
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            // delete local string from the array on the table
            toDoList.removeAtIndex(indexPath.row);
            // delete stored string from the array on the table
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList");
            // update the table (like revalidate or repaint methods in Java)
            toDoListTable.reloadData();
        }
    }
    
    // show the data on the table even after switching 
    override func viewDidAppear(animated: Bool) {
        toDoListTable.reloadData();
    }

}

