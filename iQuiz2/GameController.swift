//
//  GameController.swift
//  iQuiz2
//
//  Created by Jill Lopez on 11/12/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

//import Cocoa
import UIKit

struct Question {
    var question : String
    var answers : [String]
    var correctAnswer : String
}

class GameController: UIViewController {
    
    var selectedQuiz = ""   //string of the quiz title selected
    var currentQuiz : [Question] = []   //stores the quiz struct
    var answers : [String] = [] //stores the answers of the question in an array
    var correctAnswer = "" //string of correct answer of the question
    var answerChosen = ""   //string of answer the user selected
    var totalScore = 0  //current answer
    var questionsLeft = 10   //number of questions left
    var currentQuestion = ""    //current question of quiz
    var numOfQuestions = 10     //number of questions total
    var buttonSelected = false  //boolean to check if a button answer has been selected
    
    var itWorked = ""
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerOneButton: UIButton!
    @IBOutlet weak var answerTwoButton: UIButton!
    @IBOutlet weak var answerThreeButton: UIButton!
    @IBOutlet weak var answerFourButton: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var mathQuiz = [Question(question: "What is 4 * 5?", answers: ["a. 0", "b. 10", "c. 20", "d. 25"], correctAnswer: "c. 20")]
    
    var marvelQuiz = [Question(question: "Who is Iron Man?", answers: ["a. Steve Rogers", "b. Bruce Hammer", "c. Thor", "d. Tony Stark"], correctAnswer: "d. Tony Stark")]
    
    var scienceQuiz = [Question(question: "What is evaporation?", answers: ["a. Liquid to vapor", "b. Water vapor to liquid", "c. Solid to liquid", "d. None of the above"], correctAnswer: "a. Liquid to vapor")]
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.title = selectedQuiz
        
        
        if selectedQuiz == "Mathematics" {
            currentQuiz = mathQuiz
            answers = mathQuiz[0].answers
            
            questionLabel.text = currentQuiz[0].question
            correctAnswer = currentQuiz[0].correctAnswer
            currentQuestion = currentQuiz[0].question
            
            answerOneButton.setTitle(answers[0], forState: .Normal)
            answerTwoButton.setTitle(answers[1], forState: .Normal)
            answerThreeButton.setTitle(answers[2], forState: .Normal)
            answerFourButton.setTitle(answers[3], forState: .Normal)

        } else if selectedQuiz == "Marvel Super Heroes" {
            currentQuiz = marvelQuiz
            answers = marvelQuiz[0].answers
            
            questionLabel.text = currentQuiz[0].question
            correctAnswer = currentQuiz[0].correctAnswer
            currentQuestion = currentQuiz[0].question
            
            answerOneButton.setTitle(answers[0], forState: .Normal)
            answerTwoButton.setTitle(answers[1], forState: .Normal)
            answerThreeButton.setTitle(answers[2], forState: .Normal)
            answerFourButton.setTitle(answers[3], forState: .Normal)
            
        } else if selectedQuiz == "Science" {
            currentQuiz = scienceQuiz
            answers = scienceQuiz[0].answers
            
            questionLabel.text = currentQuiz[0].question
            correctAnswer = currentQuiz[0].correctAnswer
            currentQuestion = currentQuiz[0].question
            
            answerOneButton.setTitle(answers[0], forState: .Normal)
            answerTwoButton.setTitle(answers[1], forState: .Normal)
            answerThreeButton.setTitle(answers[2], forState: .Normal)
            answerFourButton.setTitle(answers[3], forState: .Normal)
            
        }
        
        submitButton.enabled = false
        submitButton.layer.backgroundColor = UIColor.grayColor().CGColor
    }
    
    @IBAction func oneSelected(sender: AnyObject) {
        if answerOneButton.titleLabel?.text == correctAnswer {
            totalScore++
            print("correct!")
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
        /*
        answerOneButton.layer.borderWidth = 3;
        answerOneButton.layer.borderColor = UIColor(red: 36/255, green: 124/255, blue: 255/255, alpha: 1.0).CGColor
        */
        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor
        questionsLeft--
    }
    

    @IBAction func twoSelected(sender: AnyObject) {
        if answerTwoButton.titleLabel?.text == correctAnswer {
            totalScore++
            print("correct!")
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
        
        /*answerTwoButton.layer.borderWidth = 3;
        answerTwoButton.layer.borderColor = UIColor(red: 36/255, green: 124/255, blue: 255/255, alpha: 1.0).CGColor
        */

        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor
        questionsLeft--
        
    }
    
    
    @IBAction func threeSelected(sender: AnyObject) {
        if answerThreeButton.titleLabel?.text == correctAnswer {
            totalScore++
            print("correct!")
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
        
        
        /*answerThreeButton.layer.borderWidth = 3;
        answerThreeButton.layer.borderColor = UIColor(red: 36/255, green: 124/255, blue: 255/255, alpha: 1.0).CGColor
        */
        
        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor
        questionsLeft--
    }
    
    @IBAction func fourSelected(sender: AnyObject) {
        if answerFourButton.titleLabel?.text == correctAnswer {
            
            totalScore++
            print("correct!")
        }
        
        if buttonSelected == true {
            answerOneButton.selected = false
            answerTwoButton.selected = false
            answerThreeButton.selected = false
        }
        
        answerChosen = (answerFourButton.titleLabel?.text)!
        answerFourButton.selected = true
        buttonSelected = true
        
        submitButton.enabled = true;
        /*
        answerFourButton.layer.borderWidth = 3;
        answerFourButton.layer.borderColor = UIColor(red: 36/255, green: 124/255, blue: 255/255, alpha: 1.0).CGColor
        */
        submitButton.layer.backgroundColor = UIColor(red: 246/255, green: 111/255, blue: 60/255, alpha: 1.0).CGColor
        questionsLeft--
    }
    
    
    //gets the cell that was selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let cell = tableView.cellForRowAtIndexPath(indexPath)
        //self.selectedTitle = (cell?.textLabel?.text)!
        self.performSegueWithIdentifier("AnswerSegue", sender: nil)
    }
    
    //prepares for segue (Main)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
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
            
            
        }
        
    }

 
}
