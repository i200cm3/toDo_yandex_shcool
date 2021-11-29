//
//  ViewController.swift
//  toDo
//
//  Created by Vitaliy on 26.11.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let td = TodoItem(byText: "text", important: enumImportant.normal, deathline: Date.now)
        let json = td.json
        
        let td2 = TodoItem.parse(json: json)
        
        print(td2)
        // Do any additional setup after loading the view.
    }


}

