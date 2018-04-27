//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by sam on 4/26/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage : String!
    
    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let LoadInImage = selectedImage {
            picture.image = UIImage(named: selectedImage)
            title = selectedImage
        }
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        
    }
    
}
