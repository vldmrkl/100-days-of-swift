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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
