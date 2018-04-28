//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by sam on 4/26/18.
//  Copyright © 2018 patrick. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedImage : String! {
        didSet{
            print("%% detailVC's selectedImage get the value:\(selectedImage)")
        }
    }
    
    @IBOutlet weak var picture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("$$ in DetialsVC's viewDidLoad")
        if let LoadInImage = selectedImage {
            picture.image = UIImage(named: selectedImage)
            title = LoadInImage
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.action, target: self, action: #selector(shareTapped))
            
        }
        
    }

    @objc func shareTapped() {
        
        let actVC = UIActivityViewController(activityItems: [picture.image!], applicationActivities: [])
        actVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(actVC, animated: true, completion: nil)

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
