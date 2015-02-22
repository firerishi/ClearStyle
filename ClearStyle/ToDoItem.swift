//
//  ToDoItem.swift
//  ClearStyle
//
//  Created by Srinivas, Thirumalaa on 2/22/15.
//  Copyright (c) 2015 Srinivas, Thirumalaa. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    
    var text: String

    var completed: Bool
    
    init(text: String) {
        self.text = text
        self.completed = false
    }
   
}
