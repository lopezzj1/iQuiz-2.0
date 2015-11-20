//
//  AnswerController.swift
//  iQuiz2
//
//  Created by Jill Lopez on 11/13/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

class AnswerController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    var currentQuestion = ""
    
    @IBOutlet weak var answerLabel: UILabel!
    var answer = ""
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var currentScore: UILabel!
    
    var numOfQuestions = 0
    
    var score = 0
    
    var questionsLeft = 0
    
    var questionsAnswered = 0
    
    
    var currentQuiz : [Question] = []
    
    var selectedQuiz = ""
    
    @IBOutlet weak var next: UIButton!
    
    var displayAnswer = ""
    
    var currentCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        displayLabel.text = displayAnswer
        questionLabel.text = ("Q: \(currentQuestion)")
        answerLabel.text = ("A: \(answer)")
        currentScore.text = "Your current score is: \(score)/\(numOfQuestions)"
        //print ("from answercontroller \(questionsLeft)")
        //print("score: \(score)")

    }
    
    @IBAction func nextButton(sender: AnyObject) {
        
        if questionsLeft > 0 {
            self.performSegueWithIdentifier("ContinueGame", sender: nil)
        } else if questionsLeft == 0 {
            self.performSegueWithIdentifier("FinalSegue", sender: nil)
        }
        
    }
    
    

    //prepares for segue (Main)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if questionsLeft > 0 {
            if let gameController = segue.destinationViewController as? GameController {
                gameController.currentQuiz = currentQuiz
                gameController.selectedQuiz = selectedQuiz
                gameController.questionsLeft = questionsLeft
                gameController.totalScore = score
                currentCount++
                gameController.currentCount = currentCount
                gameController.questionsAnswered = questionsAnswered
            }
        } else if questionsLeft == 0  {
            if let finalController = segue.destinationViewController as? FinalViewController {
                
                finalController.numberOfQuestions = numOfQuestions
                finalController.finalScore = score
            }
        }

    }


    
}
