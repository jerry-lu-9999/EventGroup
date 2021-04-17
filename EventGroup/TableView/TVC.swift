//
//  TVC.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/9/21.
//

import UIKit

class TVC: UITableViewController{
    
    //you’re telling the search controller that you want to use the same view you’re searching to display the results
    let searchController = UISearchController(searchResultsController: nil)
    
    var eventsArr = [Event]()
    var filteredEvents: [Event] = []
    var isSearchBarEmpty : Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering : Bool {
        return searchController.isActive && !isSearchBarEmpty
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EventGroup"
        self.tableView.rowHeight = 200
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1)
        
        getDataFromURL()
        
        //searchBar setup
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Events"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        view.backgroundColor = UIColor(red: 135/255.0, green: 206/255.0, blue: 250/255.0, alpha: 1)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          if isFiltering {
            return filteredEvents.count
          }
          return eventsArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else{
            fatalError("expected tableViewCell")
        }
        
        let currEvent : Event
        
        if isFiltering {
            currEvent = filteredEvents[indexPath.row]
        }else{
            currEvent = eventsArr[indexPath.row]
        }
        
        if let url = URL(string: currEvent.performers[0].image) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async { /// execute on main thread
                    cell.eventImage.contentMode = UIView.ContentMode.scaleAspectFit
                    cell.eventImage.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        
        cell.title.adjustsFontSizeToFitWidth = true
        cell.location.adjustsFontSizeToFitWidth = true
        cell.timeStamp.adjustsFontSizeToFitWidth = true
        
        cell.title.sizeToFit()
        cell.location.sizeToFit()
        
        cell.title.text = currEvent.title
        cell.location.text = currEvent.venue.extended_address
        
        let time = currEvent.datetime_local.split(separator: "T")
        cell.timeStamp.text = time[0] + " " + time[1]
        
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
        let currEvent : Event
        
        if isFiltering {
            currEvent = filteredEvents[(tableView.indexPathForSelectedRow?.row)!]
        } else{
            currEvent = eventsArr[(tableView.indexPathForSelectedRow?.row)!]
        }
        
        if let destination = segue.destination as? detailVC{
            destination.details = currEvent
        }
    }
    
    func filterContentForSearchText(_ searchText: String) {
      filteredEvents = eventsArr.filter { (event: Event) -> Bool in
        return event.title.lowercased().contains(searchText.lowercased())
      }
      tableView.reloadData()
    }

    private func getDataFromURL(){
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
                } catch  {
                    print("in debug print")
                    debugPrint(error)
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }

}

extension TVC: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}
