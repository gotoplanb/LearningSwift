//
//  ViewController.swift
//  TaskIt
//
//  Created by David Stanton on 2/16/15.
//  Copyright (c) 2015 David Stanton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray: [Dictionary<String,String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let task1: Dictionary<String, String> = [
            "task": "Study French",
            "subtask": "Verbs",
            "date": "01/14/2014"
        ]
        let task2: Dictionary<String, String> = [
            "task": "Eat Dinner",
            "subtask": "burgers",
            "date": "01/14/2014"
        ]
        let task3: Dictionary<String, String> = [
            "task": "Gym",
            "subtask": "leg day",
            "date": "01/14/2014"
        ]
        taskArray = [task1, task2, task3]
        println(task1["task"])
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UITableViewDataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        println(indexPath.row)
        
        let taskDict: Dictionary = taskArray[indexPath.row]
        
        var cell: TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = taskDict["task"]
        cell.descriptionLabel.text =  taskDict["subtask"]
        cell.dateLabel.text = taskDict["date"]
        
        return cell

    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}

