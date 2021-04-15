//
//  TVC.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/9/21.
//

import UIKit

class TVC: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    let searchController = UISearchController(searchResultsController: nil)
    
    var eventsArr = [Event]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "EventGroup"
        self.tableView.rowHeight = 200
        
        let webURL = URL(string: "https://api.seatgeek.com/2/events?client_id=" + Constants.client_id)!
        let request = URLRequest(url: webURL)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request){(data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Response.self, from: data)
                    
                    self.eventsArr = response.events
                    print(self.eventsArr[0].title)
                } catch  {
                    print("in debug print")
                    debugPrint(error)
                }
            }
        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventsArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else{
            fatalError("expected tableViewCell")
        }
        
        let currEvent = self.eventsArr[indexPath.row]
        
        if let url = URL(string: "https://seatgeek.com/images/performers-landscape/generic-minor-league-baseball-b73b72/677210/32398/huge.jpg") {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    cell.eventImage.contentMode = UIView.ContentMode.scaleAspectFit
                    cell.eventImage.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
        
        cell.title.sizeToFit()
        cell.location.sizeToFit()
        
        cell.title.text = currEvent.title
        cell.title.adjustsFontSizeToFitWidth = true
        cell.location.text = currEvent.venue.extended_address
        cell.timeStamp.text = currEvent.datetime_local
        return cell
    }
    
    // MARK: - Table View Animation
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        UIView.animate(withDuration: 0.5,
                       delay: 0.1 * Double(indexPath.row),
                       animations: {cell.alpha = 1})
    }
    
    
    //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? detailVC{
//
//        }
    }
    

}

extension TVC: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    // TODO
  }
}

