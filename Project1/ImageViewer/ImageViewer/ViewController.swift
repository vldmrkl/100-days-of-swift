//
//  ViewController.swift
//  ImageViewer
//
//  Created by Volodymyr Klymenko on 2019-03-03.
//  Copyright © 2019 Volodymyr Klymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	var images: [String] = []

	override func viewDidLoad() {
		super.viewDidLoad()

		let fm = FileManager.default
		let path = Bundle.main.resourcePath!
		let items = try! fm.contentsOfDirectory(atPath: path)

		for item in items {
			if item.hasPrefix("img"){
				images.append(item)
			}
		}
		print(images)
	}


}

