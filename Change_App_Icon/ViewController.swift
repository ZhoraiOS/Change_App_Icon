//
//  ViewController.swift
//  Change_App_Icon
//
//  Created by Zhora Babakhanyan on 9/6/22.
//

/*
 IMPORTANT When you Want to add another Icon you should have same image in @2x and @3x
 and also add them in info.plist file
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var iconListTableView: UITableView!
    var iconList  = [IconModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.iconListTableView.register(UINib(nibName: "AppIconTableViewCell", bundle: nil),
                                        forCellReuseIdentifier: "AppIconTableViewCell")
        
        self.iconList.append(IconModel(iconImage: "CalculatorIcon", iconName: "Calculator Icon"))
        self.iconList.append(IconModel(iconImage: "CarNewsIcon", iconName: "Car News"))
        self.iconList.append(IconModel(iconImage: "NewsIcon", iconName: "News"))
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.iconList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppIconTableViewCell", for: indexPath)
        as! AppIconTableViewCell
        cell.cellConfiguration(element: self.iconList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UIApplication.shared.supportsAlternateIcons {
            UIApplication.shared.setAlternateIconName(self.iconList[indexPath.row].iconImage){ error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Done!")
                }
            }
        }
    }
}
