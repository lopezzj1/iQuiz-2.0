//
//  ViewController.swift
//  iQuiz2
//
//  Created by Jill Lopez on 11/11/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableVivew: UITableView!
    
    var quizTitles : [String] = ["Mathematics", "Marvel Super Heroes", "Science"]
    
    var quizSubtitle : [String] = ["A quiz on simple math in addition, subtraction, multiplication, and division", "A quiz on Marvel's superheroes", "A quiz on scienc-y stuff"]
    
    
    var quizImage : [UIImage] = [
        (UIImage(named: "calc.png"))!,
        (UIImage(named: "superhero.png"))!,
        (UIImage(named: "science.png"))!
    ]
    
    @IBOutlet weak var settingsButton: UIButton!
    
    
    var selectedTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        super.title = "iQuiz"
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
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath)
        -> CGFloat {
            return 65
    }
    
    //gets the cell that was selected
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        self.selectedTitle = (cell?.textLabel?.text)!
        self.performSegueWithIdentifier("GameSegue", sender: nil)
    }
    
    //prepares for segue (Main)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let gameController = segue.destinationViewController as? GameController
        {
            //gameController.selectedQuiz = selectedTitle
            gameController.selectedQuiz = selectedTitle
        }
        
    }
    
    
    @IBAction func settingsSelected(sender: AnyObject) {
        let alertController = UIAlertController(title: "Settings", message: "Settings Go Here!", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

  
}

