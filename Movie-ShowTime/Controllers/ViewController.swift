//
//  ViewController.swift
//  Movie-ShowTime
//
//  Created by Najmul Hasan on 12/25/17.
//  Copyright © 2017 Najmul Hasan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieList = [Movie]()
    let mainUrl = "https://data.sfgov.org/api/views/yitu-d5am/rows.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    //Fetch data by service call using DataTask operation, we could make it from a seperate object, here its simple enough
    func fetchData(){
        
        let remoteService = RemoteService()
        remoteService.fetchItems(from: URL.init(string: mainUrl)!) { movies in
            
            self.movieList = movies 
            
            //Switch to main thread and update table view
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func actionSortMovies(sender: Any?){
        
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheet: UIAlertController = UIAlertController(title: "Option to Sort", message: "", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "By Movie Name", style: .default) { _ in
            
            self.movieList.sort(by: {$0.title < $1.title})
            self.tableView.reloadData()
        }
        actionSheet.addAction(cancelActionButton)
        
        let saveActionButton = UIAlertAction(title: "By Released Year", style: .default) { _ in
            
            self.movieList.sort(by: {$0.releaseYear < $1.releaseYear})
            self.tableView.reloadData()
        }
        actionSheet.addAction(saveActionButton)
        
        let deleteActionButton = UIAlertAction(title: "Delete", style: .cancel){ _ in
}
        actionSheet.addAction(deleteActionButton)
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let  indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        let movie = movieList [(indexPath?.row)!]
        
        let controller: MapViewController = segue.destination as! MapViewController
        controller.location = movie.locations
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movieList [indexPath.row]
        
        cell.tileLabel.text = movie.title
        cell.locationLabel.text = movie.locations
        cell.dateLabel.text = "\(String(describing: DataOrganizer.formateDateFromTimeStamp(Double(movie.updatedDate))))"
        cell.yearLabel.text = "\(String(describing: movie.releaseYear))"
        
        return cell
    }
}

// MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.0
    }
    
    //We are not handling details operation here
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
