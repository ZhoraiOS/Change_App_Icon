//
//  AppIconTableViewCell.swift
//  Change_App_Icon
//
//  Created by Zhora Babakhanyan on 9/6/22.
//

import UIKit

struct IconModel{
    var iconImage: String
    var iconName: String
}

class AppIconTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconName: UILabel!
    
    func cellConfiguration(element: IconModel){
        self.iconName.text = element.iconName
        self.iconImage.image = UIImage(named: element.iconImage)
    }
    
}
