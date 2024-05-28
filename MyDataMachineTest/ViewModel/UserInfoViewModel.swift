//
//  UserInfoViewModel.swift
//  MyDataMachineTest
//
//  Created by Sitaram on 27/05/24.
//

import Foundation
import UIKit

// MARK: - Protocols
protocol UserInfoViewModelDelegate {
    func userDataDisplay(userInfoModel: [UserInfo]?)
}


class UserInfoViewModel:UserInfoServiceLayerDelegate {
    
    var serviceLayer: UserInfoServiceLayer = UserInfoServiceLayer()
    var delegate: UserInfoViewModelDelegate? = nil
    
    func getUserApiData(limit:Int?, pageNo: Int?){
        self.serviceLayer.delegate = self
        self.serviceLayer.getUserApiList(limit: limit ?? 1, page: pageNo ?? 1) 
    }
    
    func responseOfUserlist(data: [UserInfo]?) {
        delegate?.userDataDisplay(userInfoModel: data)
    }
    
}


