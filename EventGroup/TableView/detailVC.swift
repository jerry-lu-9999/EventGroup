//
//  detailVC.swift
//  EventGroup
//
//  Created by Jiahao Lu on 4/9/21.
//

import UIKit

class detailVC: UIViewController {

    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var likeButton: UIBarButtonItem!
    
    var details : Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = details.title
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTapLike(_ sender: Any) {
        
    }
    
}
