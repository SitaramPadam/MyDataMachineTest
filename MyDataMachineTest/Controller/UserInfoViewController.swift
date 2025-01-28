//
//  UserInfoViewController.swift
//  MyDataMachineTest
//
//  Created by Sitaram on 27/05/24.
//

import UIKit



class UserInfoViewController: UIViewController  {
            
    @IBOutlet var userInfoView:UserInfoView!
    
    var viewModel:UserInfoViewModel = UserInfoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInfoView.setUPUI()
        userInfoView.delegate = self
        viewModel.delegate    = self
        
        let concurrentQue = DispatchQueue(label: "com.concurent.queue",attributes: .concurrent)
        concurrentQue.async {
            self.viewModel.getUserApiData(limit: 10, pageNo: 1)
        }
    }
}


func multiThreadingConcepts(){
    
//    let concurrentQueue = DispatchQueue(label: "swiftlee.concurrent.queue", attributes: .concurrent)
//
//    concurrentQueue.async {
//        // Perform the data request and JSON decoding on the background queue.
//        fetchData()
//
//        DispatchQueue.main.async {
//            /// Access and reload the UI back on the main queue.
//            tableView.reloadData()
//        }
//    }
}

extension UserInfoViewController:UserInfoViewModelDelegate,userInfoViewDelegate  {
    func navigateToNextView(details: UserInfo?) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.detailsInfo = details
        self.present(vc, animated:true)
    }
    
    
    func userDataDisplay(userInfoModel: [UserInfo]?) {
        if userInfoModel!.count > 0 {
            userInfoView.updateTableView(userInfoModel: userInfoModel)
        }
    }
}

