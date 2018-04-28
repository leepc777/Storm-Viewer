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
//    var images = [Data]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Storm Viewer"

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        print("$$ you tap the row: \(indexPath.row) : \(pictures[indexPath.row])")
//        detailVC.picture.image = UIImage(named: pictures[indexPath.row])
//        let detailImg = UIImage(named: pictures[indexPath.row])
//        if let image = detailImg {
//            print("$$ update detailVC")
//            detailVC.picture.image = image
//            //at this point, UIImageView picture is not loaded yet. a NIL
//        }
        detailVC.selectedImage = pictures[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
