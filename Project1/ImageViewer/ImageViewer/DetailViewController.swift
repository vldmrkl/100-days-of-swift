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
	var selectedImageIndex: Int?
	var totalNumberOfImages: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Image \(selectedImageIndex ?? 0) of \(totalNumberOfImages ?? 9999)"
		navigationItem.largeTitleDisplayMode = .never

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
