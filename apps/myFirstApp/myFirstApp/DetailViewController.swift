//
//  DetailViewController.swift
//  myFirstApp
//
//  Created by José Cantú on 21/10/22.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    var imageName: String?
    var detailImage: (Int, Int)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = imageName {
            imageView.image = UIImage(named: image)
        }
        
        title = "imageName - Picture \(detailImage!.0) of \(detailImage!.1)"
        navigationItem.largeTitleDisplayMode = .never

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
}
