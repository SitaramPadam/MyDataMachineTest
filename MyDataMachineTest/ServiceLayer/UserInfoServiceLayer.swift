//
//  UserInfoServiceLayer.swift
//  MyDataMachineTest
//
//  Created by Sitaram on 27/05/24.
//

import Foundation

// MARK: - Protocols
protocol UserInfoServiceLayerDelegate: AnyObject{
    func responseOfUserlist(data: [UserInfo]?)
}

class UserInfoServiceLayer {
    
    weak var delegate:UserInfoServiceLayerDelegate?
    
    // MARK: - API Call
    func getUserApiList(limit: Int, page:Int) {
       
        let urlString = "https://jsonplaceholder.typicode.com/posts?_page=\(page)&_limit=\(limit)"
        
        guard let requestUrl = URL(string: urlString) else { return }
        APIWapperClass.shared.getCall(url: RequestURL(url:requestUrl), [UserInfo].self, nil) { [self] result in
            switch result {
            case .success(let model):
                delegate?.responseOfUserlist(data: model)
            case .failure(let error):
                print(error)
            }
        }
    }
}
