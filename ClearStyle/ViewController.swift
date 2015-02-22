//
//  ViewController.swift
//  ClearStyle
//
//  Created by Srinivas, Thirumalaa on 2/22/15.
//  Copyright (c) 2015 Srinivas, Thirumalaa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    var toDoItems = [ToDoItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
//        tableView.separatorStyle = .SingleLine
        tableView.separatorColor = UIColor(white: 1.0, alpha: 0.5)
//        tableView.backgroundColor = UIColor(hue: 29, saturation: 14, brightness: 73, alpha: 1.0)
        tableView.rowHeight = 50.0
        tableView.layoutMargins = UIEdgeInsetsZero
        
        if toDoItems.count > 0 {
            return
        }
        
        toDoItems.append(ToDoItem(text: "Duck"))
        toDoItems.append(ToDoItem(text: "feed the cat"))
        toDoItems.append(ToDoItem(text: "buy eggs"))
        toDoItems.append(ToDoItem(text: "watch WWDC videos"))
        toDoItems.append(ToDoItem(text: "rule the Web"))
        toDoItems.append(ToDoItem(text: "buy a new iPhone"))
        toDoItems.append(ToDoItem(text: "darn holes in socks"))
        toDoItems.append(ToDoItem(text: "write this tutorial"))
        toDoItems.append(ToDoItem(text: "master Swift"))
        toDoItems.append(ToDoItem(text: "learn to draw"))
        toDoItems.append(ToDoItem(text: "get more exercise"))
        toDoItems.append(ToDoItem(text: "catch up with Mom"))
        toDoItems.append(ToDoItem(text: "get a hair cut"))
        toDoItems.append(ToDoItem(text: "rule the Web"))
        toDoItems.append(ToDoItem(text: "buy a new iPhone"))
        toDoItems.append(ToDoItem(text: "darn holes in socks"))
        toDoItems.append(ToDoItem(text: "write this tutorial"))
        toDoItems.append(ToDoItem(text: "master Swift"))
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",
            forIndexPath: indexPath) as TableViewCell
        let item = toDoItems[indexPath.row]
//        cell.textLabel?.text = item.text
        cell.textLabel?.textColor = UIColor.whiteColor()
//        cell.backgroundColor = UIColor(hue: 29, saturation: 14, brightness: 73, alpha: 1.0)
        cell.layoutMargins = UIEdgeInsetsZero;
        cell.delegate = self
        cell.toDoItem = item
        return cell
    }
    
    func toDoItemDeleted(toDoItem: ToDoItem) {
        let index = (toDoItems as NSArray).indexOfObject(toDoItem)
        if index == NSNotFound { return }
        
        toDoItems.removeAtIndex(index)
        
        tableView.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        tableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        tableView.endUpdates()    
    }
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = toDoItems.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 0.9, green: 0.2, blue: val, alpha: 1.0)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            cell.backgroundColor = colorForIndex(indexPath.row)
    }


}

