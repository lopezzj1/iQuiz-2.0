//
//  ViewController.swift
//  iQuiz2
//
//  Created by Jill Lopez on 11/11/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

struct Question {
    var title : String
    var question : String
    var answers : [String]
    var correctAnswer : String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableVivew: UITableView!
    
    var quizTitles : [String] = ["Mathematics", "Marvel Super Heroes", "Science"]
    
    var quizSubtitle : [String] = ["A quiz on simple math in addition, subtraction, multiplication, and division", "A quiz on Marvel's superheroes", "A quiz on scienc-y stuff"]
    
    var mathQuiz = [Question(title: "", question: "What is 4 * 5?", answers: ["a. 0", "b. 10", "c. 20", "d. 25"], correctAnswer: "3")]
    
    var marvelQuiz = [Question(title: "", question: "Who is Iron Man?", answers: ["a. Steve Rogers", "b. Bruce Hammer", "c. Thor", "d. Tony Stark"], correctAnswer: "4")]
    
    var scienceQuiz = [Question(title: "", question: "What is evaporation?", answers: ["a. Liquid to vapor", "b. Water vapor to liquid", "c. Solid to liquid", "1"], correctAnswer: "1")]
    
    var quizzes = []
    
    var createNewQuiz = false

    var newQuiz : [Question] = []
    
    var selectedTitle = ""
    
    var quizImage : [UIImage] = [
        (UIImage(named: "calc.png"))!,
        (UIImage(named: "superhero.png"))!,
        (UIImage(named: "science.png"))!
    ]
    
    
    @IBOutlet weak var settingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = ("iQuiz")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // return how many sections are in table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //creates the number of rows/cells needed
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizTitles.count
    }
    
    //creates the title, subtitle, and image for each cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath)
        
        cell.textLabel!.text = quizTitles[indexPath.row]
        cell.detailTextLabel?.text = quizSubtitle[indexPath.row]
        cell.imageView?.image = quizImage[indexPath.row]
        
        return cell
    }
    
    //row Height
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 65
    }
    
    //gets the cell that was selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        self.selectedTitle = (cell?.textLabel?.text)!
        
        if createNewQuiz == false {
            if selectedTitle == "Mathematics" {
                newQuiz = mathQuiz
            } else if selectedTitle == "Science" {
                newQuiz = scienceQuiz
            } else if selectedTitle == "Marvel Super Heroes" {
                newQuiz = marvelQuiz
            }
        } else if createNewQuiz == true {
            loadQuiz()
        }
        
        self.performSegueWithIdentifier("GameSegue", sender: nil)
    }
    
    //prepares for segue (Main)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let gameController = segue.destinationViewController as? GameController
        {
            gameController.selectedQuiz = selectedTitle
            gameController.currentQuiz = newQuiz
            
        }
    }
    
    
    @IBAction func settingsSelected(sender: AnyObject) {
        /*let alertController = UIAlertController(title: "Settings", message: "Settings Go Here!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)*/
        
        //self.navigationController?.pushViewController(alertController, animated: true)
        
    }

    @IBAction func goBack(segue : UIStoryboardSegue){
        print("moved back")
        createNewQuiz = true
        loadTable()
    }
    
    
    func loadTable() {
        
        for var i = 0; i < quizzes.count; i++ {
            quizTitles[i] = (quizzes[i] as! NSDictionary)["title"] as! String
            quizSubtitle[i] = (quizzes[i] as! NSDictionary)["desc"] as! String
        }
    }
    
    func loadQuiz(){
        
        for quiz in quizzes {
            let title = quiz["title"] as! String
            
            if title == selectedTitle {
                
                print(title)
                
                for question in quiz["questions"] as! [NSDictionary] {
                    
                    let answer = question["answer"] as! String
                    let answers = question["answers"] as! [String]
                    let quizQuestion = question["text"] as! String
                    
                    newQuiz.append(Question(title: title, question: quizQuestion, answers: answers, correctAnswer: answer))
                }
            }
        }
    }
    
    
    
    
    override func viewWillAppear(animated: Bool){
        self.tableVivew.reloadData()
    }
  
    
}

