//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestion = ListQuestions()
    var pickAnswer: Bool = false
    var qestionNumber: Int = 0
    
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        
        
        
        if sender.tag == 1 {
            pickAnswer = true
            
            
        } else if sender.tag == 2 {
            pickAnswer = false
        }
        
        checkAnswer()
        
        qestionNumber += 1
        
        nextQuestion()
    }
    
    
    func updateUI() {
        
        if qestionNumber <= 12 {
            scoreLabel.text = "Score : \(score)"
            progressLabel.text = "\(qestionNumber + 1)/\(allQuestion.list.count)"
            progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(qestionNumber + 1)
        } else {
           startOver()
        }
    }
    

    func nextQuestion() {
        if qestionNumber <= 12 {
          questionLabel.text = allQuestion.list[qestionNumber].questionsText
            updateUI()
        } else {
           let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, with score \(score) Do you went start over ? ", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                
                self.startOver()
                
            })
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    func checkAnswer() {
        
        
        let correctAnswer = allQuestion.list[qestionNumber].answer
        
        if correctAnswer == pickAnswer {
            print("You Got it!")
            score += 1
            updateUI()
        } else {
            print("wrong !")
        }
        
    }
    
    
    func startOver() {
        
        qestionNumber = 0
        nextQuestion()
        score = 0
        
    }
    

    
}
