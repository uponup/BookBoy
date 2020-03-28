//
//  NoteDetailViewController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class NoteDetailViewController: ViewController {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Note Detail", comment: "")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
