//
//  SettingsViewController.swift
//  iQuiz2
//
//  Created by Jill Lopez on 11/19/15.
//  Copyright © 2015 Jill Lopez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var urlTextBox: UITextField!
    
    var newQuiz : [NSDictionary] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.urlTextBox.text = "http://tednewardsandbox.site44.com/questions.json"
        
        
    }

    
    @IBAction func downloadSelected(sender: AnyObject) {
        
        let newURL = self.urlTextBox.text
        
        let sessionConfig = NSURLSessionConfiguration.defaultSessionConfiguration()
        
        let session = NSURLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        let URL = NSURL(string: newURL!)
        
        let request = NSMutableURLRequest(URL: URL!)
        
        request.HTTPMethod = "GET"
        
        //start task
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            //success
            let statusCode = (response as! NSHTTPURLResponse).statusCode
            
            print("URL Session Task Succeeded: HTTP\(statusCode)")
            
            do {
                self.newQuiz = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! [NSDictionary]
                //print(self.newQuiz)
            } catch {
                
            }
            
        }
        
        task.resume()
        
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let settingsController = segue.destinationViewController as? ViewController {
            settingsController.quizzes = self.newQuiz
        }
        
        
    } 
}
