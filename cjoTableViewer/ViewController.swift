//
//  ViewController.swift
//  cjoTableViewer
//
//  Created by Thomas Morel on 4/28/19.
//  Copyright © 2019 OMJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var actorRow: UIView!
    
 /*
 func WebLink(sender: AnyObject) {
        if let url = NSURL(string: "https://\(sender)") {
            UIApplication.shared.open(url as URL, options: sender as! String )
        }
    }
     @IBOutlet weak var actorCellView: UIView!
     */
    @IBOutlet weak var tableView: UITableView!
    final let url = URL(string: "https://juniorofficer.army.mil/wp-json/wp/v2/posts?categories=660")
    
   // tableView.rowHeight = UITableViewAutomaticDimension
    
    var actors = [BlogItemElement]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        downloadJSON()
    }

    func downloadJSON(){
        
        guard let downLoadURL = url else {return}
        
        let task = URLSession.shared.blogItemTask(with: downLoadURL) { blogItem, response, error in
            if let newBlogItem = blogItem {
            
                for currentItem in newBlogItem{
                self.actors.append(currentItem)
                    
                }
            }
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }.resume()
       // print(actors[0])
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell") as? ActorTableViewCell else { return UITableViewCell()}
            
        cell.statusLabel.text = actors[indexPath.row].content.rendered
        
        
        cell.linkLabel.text = actors[indexPath.row].title.rendered
        cell.urlLink = actors[indexPath.row].link
        return cell
    
    }
    
/*
    func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
       // guard let currentCell = tableView.cellForRow(at: indexPath as IndexPath) as? ActorTableViewCell else { return }
        // launch your func WebLink with the currentCell
       //WebLink(sender: currentCell)
        print("got here")
        //print(currentCell.linkLabel)
        
        
    }
*/
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as! ActorTableViewCell
        
        //getting the text of that cell
      //  var myString = currentCell.linkLabel.text as! String
      //  let indexStart = myString.index(myString.startIndex, offsetBy: 29)
      //  let currentItem = myString[String.Index(utf16Offset: 31, in: myString)..<myString.endIndex]
       let currentItem =  currentCell.linkLabel.text
        
       // let itemLink = currentCell.
        
//        let alertController = UIAlertController(title: "Simplified iOS", message: "You Selected " + currentItem! , preferredStyle: .alert)
//       let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
//       alertController.addAction(defaultAction)
//
//       present(alertController, animated: true, completion: nil)
        
        print(currentItem! + " was just selected.")
        
        // UIApplication.shared.openURL(NSURL(string: currentCell.linkLabel.text!) as! URL)
        UIApplication.shared.open(NSURL(string: currentCell.urlLink) as! URL, completionHandler: nil)
    }
        
    
}

