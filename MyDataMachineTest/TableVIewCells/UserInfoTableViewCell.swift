//
//  UserInfoTableViewCell.swift
//  MyDataMachineTest
//
//  Created by Sitaram on 27/05/24.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet var userTitle:UILabel!
    @IBOutlet var userId:UILabel!
    @IBOutlet var userIdid:UILabel!
    @IBOutlet var bodyText:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUserDataToDisplay(userData:UserInfo?){
        
        userTitle.text = String(format: "Title : \(userData?.title?.capitalized ?? "")")
        userId.text    = String(format: "UserId : \(userData?.userId ?? 0)")
        userIdid.text  = String(format: "Id : \(userData?.id ?? 0)")
        bodyText.text  = userData?.body
        
    }
    
}
