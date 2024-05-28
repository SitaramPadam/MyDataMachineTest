//
//  DetailView.swift
//  MyDataMachineTest
//
//  Created by Sitaram on 28/05/24.
//

import UIKit

class DetailView: UIView {
    
    @IBOutlet var titleLabel:UILabel!
    @IBOutlet var userIdLabel:UILabel!
    @IBOutlet var idLabel:UILabel!
    @IBOutlet var bodyTextView:UITextView!


    
    func setUpUI(details: UserInfo){
            
        titleLabel.text    = String(format: "Title : \(details.title?.capitalized ?? "")")
        userIdLabel.text   = String(format: "UserId : \(details.userId ?? 0)")
        idLabel.text       = String(format: "Id : \(details.id ?? 0)")
        bodyTextView.text  = details.body
        
    }
}
