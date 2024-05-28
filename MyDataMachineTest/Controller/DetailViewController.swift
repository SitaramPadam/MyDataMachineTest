//
//  DetailViewController.swift
//  MyDataMachineTest
//
//  Created by Sitaram on 28/05/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var detailView:DetailView!
    
    var detailsInfo : UserInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailData = detailsInfo,detailData.title != nil {
            detailView.setUpUI(details: detailData)
        }
    }
    
   

}
