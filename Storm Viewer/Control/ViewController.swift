//
//  ViewController.swift
//  Storm Viewer
//
//  Created by sam on 4/22/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                print("$$ found photos:\(item) in directory:\(path)")
                pictures.append(item)
            }
        }

        print(pictures)
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    
}

class PrintingViewController: UIViewController {
    override func viewDidLoad() {
//        super.viewDidLoad()
        print("view has loaded")
    }
}

class UserViewController: PrintingViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // do view setup here
    }
    
    
    
}

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
//        let cell = UITableViewCell()
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
}
