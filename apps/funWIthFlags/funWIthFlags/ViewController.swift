//
//  ViewController.swift
//  funWIthFlags
//
//  Created by José Cantú on 23/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var counterTextView: UITextView!
    
    
    var countries = [
        "estonia",
        "france",
        "germany",
        "ireland",
        "italy",
        "monaco",
        "nigeria",
        "poland",
        "russia",
        "spain",
        "uk",
        "us",
    ]
    
    var score = 0
    
    var correctAnswer = 0
    
    var answeredQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        askQuestion()
        
    }

    func setupUI() {
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
 
        button1.setImage(UIImage(named: countries.randomElement() ?? countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries.randomElement() ?? countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries.randomElement() ?? countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) : Score \(score)"
        counterTextView.text = "Answered \(answeredQuestions) of 10"
    }
    
    func resetScore(action: UIAlertAction! = nil){
        score = 0
        correctAnswer = 0
        answeredQuestions = 0
        askQuestion()
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
            answeredQuestions += 1
        } else {
            title = "Wrong! That's the flag of \(countries[correctAnswer])"
            score -= 1
            answeredQuestions += 1
        }
        
        var ac: UIAlertController
        
        if (answeredQuestions == 11) {
           ac = UIAlertController(title: "Test finished", message: "You replied 10 questions, your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Finish", style: .destructive, handler: resetScore))
        } else {
             ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        }
        
        present(ac, animated: true)
    }
}

