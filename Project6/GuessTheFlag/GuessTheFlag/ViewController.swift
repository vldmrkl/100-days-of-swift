//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Volodymyr Klymenko on 2019-03-15.
//  Copyright © 2019 Volodymyr Klymenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!

    var correctAnswer: Int = 0
    var countries = [String]()
    var currentQuestion: Int = 1
    var score: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["canada", "estonia", "france", "germany", "holland", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "uk", "ukraine", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = "\(countries[correctAnswer].uppercased())"
    }

    func resetGame(action: UIAlertAction! = nil){
        countries = ["canada", "estonia", "france", "germany", "holland", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "uk", "ukraine", "us"]
        score = 0
        currentQuestion = 1
        scoreLabel.text = "Score: \(score)"
        askQuestion()
    }

    @IBAction func tapButton(_ sender: UIButton) {
        var title: String
        var message: String
        if sender.tag == correctAnswer {
            score += 1
            title = "Question \(currentQuestion)"
            message = "Correct ✅"
            countries.remove(at: sender.tag)
        } else {
            score -= 1
            title = "Question \(currentQuestion)"
            message = "Wrong ❌ \nThat's the flag of \(countries[sender.tag].uppercased())"
        }

        if currentQuestion == 10 {
            title = "Game over!"
            message = " Your final score is \(score)"
        }

        scoreLabel.text = "Score: \(score)"

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if currentQuestion < 10 {
            alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            currentQuestion += 1
        } else {
            alertController.addAction(UIAlertAction(title: "Restart", style: .default, handler: resetGame))
        }
        present(alertController, animated: true)
    }
}

