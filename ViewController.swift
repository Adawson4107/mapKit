//
//  ViewController.swift
//  Movies
//
//  Created by period3 on 3/4/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    var movies = ["cars", "Monsters inc", "Wall E"]
var ratings = ["3 stars", "4 stars", "5 stars"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell")
    cell?.textLabel?.text = movies[indexPath.row]
    cell?.detailTextLabel?.text = ratings[indexPath.row]
    
    return cell!
}
    
    
    @IBAction func editButton(_ sender: Any) {
    }
    @IBAction func addButton(_ sender: Any) {
    alert()
    
    }
    func alert(){
        let alertController = UIAlertController(title: "Hello", message: "Add a movie", preferredStyle: .alert)

        let newAction: UIAlertAction = UIAlertAction(title: "CLICK ME", style: .default) { (action) in
            let movies = alertController.textFields?.first?.text
            let ratings = alertController.textFields?.last?.text
            self.ratings.append(ratings!)
            self.movies.append(movies!)
            self.tableView.reloadData()
            
}
        alertController.addTextField { (textField) -> Void in
            textField.placeholder = "Enter Movie"
        }
        alertController.addTextField { (textField) -> Void in
            textField.placeholder = "Enter Rating"
        }
        alertController.addAction(newAction)
        
        present(alertController, animated: true, completion: nil)
        

}
    

}
