//
//  ViewController.swift
//  Project7
//
//  Created by Volodymyr Klymenko on 2020-01-13.
//  Copyright © 2020 Volodymyr Klymenko. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()
    var filteredPetitions = [Petition]()
    var fullPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showCredits))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterPetitions))

        let urlString: String

        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }

        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            } else {
                showError()
            }
        } else {
            showError()
        }
    }

    func parse(json: Data) {
        let decoder = JSONDecoder()

        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            fullPetitions = jsonPetitions.results
            petitions = fullPetitions
            tableView.reloadData()
        }
    }

    func showError() {
        let ac = UIAlertController(title: "Loading Error", message: "", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Filter Petitions", message: "Enter a filter string", preferredStyle: .alert)
        ac.addTextField()

        let filterAction = UIAlertAction(title: "OK", style: .default) { [weak self, weak ac] _ in
            guard let filterString = ac?.textFields?[0].text else { return }
            self?.filter(filterString)
        }

        ac.addAction(filterAction)
        present(ac, animated: true)
    }

    func filter(_ filterString: String) {
        if filterString.isEmpty {
            petitions = fullPetitions
        } else {
            petitions = fullPetitions.filter() { $0.title.contains(filterString) || $0.body.contains(filterString) }
        }

        tableView.reloadData()
    }

    @objc func showCredits() {
        let ac = UIAlertController(title: "Credits", message: "The data is provided by We The People API", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

