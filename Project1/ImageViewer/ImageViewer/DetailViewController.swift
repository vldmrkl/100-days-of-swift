//
//  DetailViewController.swift
//  ImageViewer
//
//  Created by Volodymyr Klymenko on 2019-03-04.
//  Copyright © 2019 Volodymyr Klymenko. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	@IBOutlet var imageView: UIImageView!
	var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

		if let imageToLoad = selectedImage {
			imageView.image = UIImage(named: imageToLoad)
		}
    }
    
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		navigationController?.hidesBarsOnTap = true
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(true)
		navigationController?.hidesBarsOnTap = false
	}
}
