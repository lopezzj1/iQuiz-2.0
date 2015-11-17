//
//  FinalViewController.swift
//  iQuiz2
//
//  Created by Jill Lopez on 11/14/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    var itWorked = ""
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    var finalScore = 0
    
    var numberOfQuestions = 0
    
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        scoreLabel.text = "\(finalScore)/\(numberOfQuestions)"
        
        let quizScore = Double(finalScore/numberOfQuestions) * 100.0
        
        if quizScore == 100.0 {
            messageLabel.text = "Wow! Perfect Score! 💯"
        } else if quizScore >= 75.0 {
            messageLabel.text = "Close enough..."
        } else if quizScore > 50.0 {
            messageLabel.text = "Try again...😐"
        } else if quizScore <= 50.0 {
            messageLabel.text = "Maybe you should go study..."
        }
        
        print(itWorked)
        
        // Do view setup here.
    }
    
}
