//
//  ViewController.swift
//  100DaySwift 2HomeWork
//
//  Created by Роман Зобнин on 03.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var contry: String = ""
    var level = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addString()
        askQuestion(action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .edit, target: self, action: #selector(tap))
    }
    
    @IBAction func buttonTap(_ sender: UIButton) {
        var title: String
        level += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong. Rite answer: \(contry)"
            score -= 1
        }
        
        if level == 2 {
            let dc = UIAlertController(title: "The end", message: "Total = \(score)", preferredStyle: .alert)
            dc.addAction(UIAlertAction(title: "Refresh", style: .default, handler: askQuestion))
            present(dc, animated: true)
            level = 0
            score = 0
        } else {
            presentAlertControllerScore()
        }
    }
    
    func addString() {
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        contry = countries[correctAnswer].uppercased()
        title = contry
        totalScore.text = "Score: \(score)"
    }
    
    @objc func tap () {
      presentAlertControllerScore()
    }
    
    func presentAlertControllerScore() {
        let vc = UIAlertController(title: "Счет", message: "Количество очков = \(score)", preferredStyle: .alert)
        vc.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(vc, animated: true)
    }
}


