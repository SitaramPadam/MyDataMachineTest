//
//  UserInfoView.swift
//  MyDataMachineTest
//
//  Created by Sitaram on 27/05/24.
//

import UIKit

protocol userInfoViewDelegate{
    func navigateToNextView(details:UserInfo?)
}

class UserInfoView: UIView {
    
    
@IBOutlet var userTableView:UITableView!
    
    var userInfoData = [UserInfo?]()
    var pageno:Int =  1
    var isLoading  = false
    let spinner = UIActivityIndicatorView(style: .medium)
    var delegate: userInfoViewDelegate? = nil
    var viewModel:UserInfoViewModel = UserInfoViewModel()
    
    func setUPUI(){
        self.userTableView.delegate   = self
        self.userTableView.dataSource = self
        self.userTableView.layer.cornerRadius = 4
        self.userTableView?.separatorStyle = .singleLine
        self.userTableView?.separatorColor = .lightGray
        self.userTableView.contentInset    = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.userTableView.showsVerticalScrollIndicator = false
        
        userTableView.register(UINib(nibName: Utility.classNameAsString(UserInfoTableViewCell.self), bundle: nil), forCellReuseIdentifier: Utility.classNameAsString(UserInfoTableViewCell.self))
        
        setupRefreshFooter()
    }
    
    func setupRefreshFooter() {
        spinner.color = UIColor.darkGray
        spinner.hidesWhenStopped = true
        self.userTableView.tableFooterView = spinner
        
    }
    
    func updateTableView(userInfoModel: [UserInfo]?){
        if userInfoModel!.count > 0 {
            userInfoData = userInfoModel!
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }
    }
    

}


extension UserInfoView :UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UserInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: Utility.classNameAsString(UserInfoTableViewCell.self), for: indexPath) as! UserInfoTableViewCell
        cell.setUserDataToDisplay(userData:  userInfoData[indexPath.row])
        
        if !isLoading && indexPath.row == userInfoData.count - 1 {
            self.spinner.startAnimating()
            self.pageno = self.pageno + 1
            viewModel.getUserApiData(limit: 10, pageNo: self.pageno)
            viewModel.delegate = self
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.navigateToNextView(details: userInfoData[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         // Here, we can calculate each label's height after placing the data in it and pass that value. Then the size of the cell will adjust to the content size. If the body text is longer, it will still fit.
        
        return 140
    }
    
    
}



extension UserInfoView:UserInfoViewModelDelegate  {
    
    func userDataDisplay(userInfoModel: [UserInfo]?) {
        
        if userInfoModel!.count > 0 {
            isLoading = false
            self.userInfoData.append(contentsOf: userInfoModel ?? [])

            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.userTableView.reloadData()
            }
        }
    }
}
