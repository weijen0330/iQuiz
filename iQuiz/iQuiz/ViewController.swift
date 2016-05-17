//
//  ViewController.swift
//  iQuiz
//
//  Created by Wei-Jen Chiang on 5/11/16.
//  Copyright © 2016 Wei-Jen Chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var categories : [String] = ["Mathematics", "Marvel Super Heroes", "Science"]
    var descriptions : [String] = ["I'm bad at math, so the equation 2n+2n is 4n to me", "I am Groot", "May The Mass Times Acceleration Be With You"]
    var images : [UIImage] = [UIImage(named: "mathematics.jpg")!, UIImage(named: "marvel.jpeg")!, UIImage(named: "science.png")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "quizCell")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.categories.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell? = self.tableView.dequeueReusableCellWithIdentifier("quizCell")! as UITableViewCell
        
        if (cell != nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        }
        
        cell!.textLabel!.text = self.categories[indexPath.row]
        cell!.detailTextLabel!.text = self.descriptions[indexPath.row]
        cell!.imageView?.image = self.images[indexPath.row]
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(indexPath.row) + 70.0;
    }
    
    @IBAction func showSettings(sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Alert", message: "Settings go here.", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (_) in }
        
        alert.addAction(cancelAction)
        alert.addAction(OKAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

}

