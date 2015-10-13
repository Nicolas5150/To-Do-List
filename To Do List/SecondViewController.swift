//
//  SecondViewController.swift
//  To Do List
//
//  Created by Nicolas Emery on 8/4/15.
//  Copyright © 2015 Nicolas Emery. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var itemTextArea: UITextField!
    
    
    @IBAction func enterItemButton(sender: AnyObject)
    {
        // add users text to the array list (short term storage)
        toDoList.append(itemTextArea.text!);
        // clear itemTextArea for new word to be entered
        itemTextArea.text = "";
        // this portion will keep the users list updated even when the user logs off (long term storage)
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // function to tap outside keyboard and slide it down
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    // remove the keyboard as well from view (when open in itemTextArea)
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        itemTextArea.resignFirstResponder()
        return true
        
    }
}

