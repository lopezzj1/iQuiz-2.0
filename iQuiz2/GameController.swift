//
//  GameController.swift
//  iQuiz2
//
//  Created by Jill Lopez on 11/12/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

//import Cocoa
import UIKit

/*struct Question {
    var question : String
    var answers : [String]
    var correctAnswer : String
}*/

class GameController: UIViewController {
    
    var currentQuiz : [Question] = []   //stores the quiz struct
    var selectedQuiz = ""   //string of the quiz title selected
    var answers : [String] = [] //stores the answers of the question in an array
    var correctAnswer = "" //string of correct answer of the question
    var answerChosen = ""   //string of answer the user selected
    var totalScore = 0  //current answer
    var questionsAnswered = 0
    var questionsLeft = 0   //number of questions left
    var currentQuestion = ""    //current question of quiz
    var currentCount = 0
    var numOfQuestions = 0     //number of questions total
    var buttonSelected = false  //boolean to check if a button answer has been selected
    //var newQuiz : []
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!

    

    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.title = selectedQuiz

        numOfQuestions = currentQuiz.count //stores the number of questions in the quiz
        questionsLeft = numOfQuestions
        currentQuestion = currentQuiz[currentCount].question
        
        //set question label to current question
        questionLabel.text = currentQuestion

        
        //store answers
        answers = currentQuiz[currentCount].answers
        
        //set answer buttons
        answerOneButton.setTitle(answers[0], forState: .Normal)
        answerTwoButton.setTitle(answers[1], forState: .Normal)
        answerThreeButton.setTitle(answers[2], forState: .Normal)
        answerFourButton.setTitle(answers[3], forState: .Normal)
        
        //set correct answer
        let answerNumber = (currentQuiz[currentCount].correctAnswer) as String
        if answerNumber == "1" {
            correctAnswer = answers[0]
        } else if answerNumber == "2" {
            correctAnswer = answers[1]
        } else if answerNumber == "3" {
            correctAnswer = answers[2]
        } else if answerNumber == "4" {
            correctAnswer = answers[3]
        }
        
        //additional UI settings
        submitButton.enabled = false
        submitButton.layer.backgroundColor = UIColor.grayColor().CGColor
    }
    
    @IBAction func oneSelected(sender: AnyObject) {
        if answerOneButton.titleLabel?.text == correctAnswer {
            totalScore++
        }
        
        if buttonSelected == true {
            answerTwoButton.selected = false
            answerThreeButton.selected = false
            answerFourButton.selected = false
        }
        
        answerChosen = (answerOneButton.titleLabel?.text)!
        answerOneButton.selected = true
        buttonSelected = true;

        submitButton.enabled = true
        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor

    }
    

    @IBAction func twoSelected(sender: AnyObject) {
        if answerTwoButton.titleLabel?.text == correctAnswer {
            totalScore++
        }
        
        if buttonSelected == true {
            answerOneButton.selected = false
            answerThreeButton.selected = false
            answerFourButton.selected = false
        }
        
        answerChosen = (answerTwoButton.titleLabel?.text)!
        answerTwoButton.selected = true
        buttonSelected = true;
        
        submitButton.enabled = true;
        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor
        
    }
    
    
    @IBAction func threeSelected(sender: AnyObject) {
        if answerThreeButton.titleLabel?.text == correctAnswer {
            totalScore++
        }
        
        if buttonSelected == true {
            answerOneButton.selected = false
            answerTwoButton.selected = false
            answerFourButton.selected = false
        }
        
        answerChosen = (answerThreeButton.titleLabel?.text)!
        answerThreeButton.selected = true
        buttonSelected = true

        submitButton.enabled = true;
        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor

    }
    
    @IBAction func fourSelected(sender: AnyObject) {
        if answerFourButton.titleLabel?.text == correctAnswer {
            totalScore++
        }
        
        if buttonSelected == true {
            answerOneButton.selected = false
            answerTwoButton.selected = false
            answerThreeButton.selected = false
        }
        
        answerChosen = (answerFourButton.titleLabel?.text)!
        answerFourButton.selected = true
        buttonSelected = true
        
        submitButton.enabled = true
        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor

    }
    
    
    //gets the cell that was selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("AnswerSegue", sender: nil)
    }
    
    //prepares for segue (Main)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        questionsAnswered++
        questionsLeft -= questionsAnswered
        if let answerController = segue.destinationViewController as? AnswerController
        {
            if answerChosen == correctAnswer {
                answerController.displayAnswer = "That's correct! 😝"
            } else if answerChosen != correctAnswer {
                answerController.displayAnswer = "That's incorrect! 😭"
            }
            
            answerController.currentQuestion = currentQuestion
            answerController.answer = correctAnswer
            answerController.numOfQuestions = numOfQuestions
            answerController.score = totalScore
            answerController.questionsLeft = questionsLeft
            answerController.currentQuiz = currentQuiz
            answerController.selectedQuiz = selectedQuiz
            answerController.score = totalScore
            answerController.currentCount = currentCount
            answerController.questionsLeft = questionsLeft
            answerController.questionsAnswered = questionsAnswered
            
        }
        
    }

 
}
