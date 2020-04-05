//
//  SettingViewController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class SettingViewController: ViewController, NibCreatable {
    
    @IBOutlet weak var labelMesg: UILabel!
    @IBOutlet weak var labelRate: UILabel!
    @IBOutlet weak var labelAbout: UILabel!
    @IBOutlet weak var redDot: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelMesg.text = NSLocalizedString("Message", comment: "")
        labelRate.text = NSLocalizedString("Rate Us", comment: "")
        labelAbout.text = NSLocalizedString("About Us", comment: "")
    }

    @IBAction func mesgControlAction(_ sender: Any) {
        self.navigationController?.pushViewController(MesgViewController(), animated: true)
    }
    @IBAction func rateUsControlAction(_ sender: Any) {
        if let url = URL(string: Urls.rateURL), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    @IBAction func aboutUsControlAction(_ sender: Any) {
        self.navigationController?.pushViewController(AboutUsController(), animated: true)
    }
}
