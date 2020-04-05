//
//  MesgViewController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/21.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class MesgViewController: ViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var headerView = MesgHeaderView.createFromNib()
    
    lazy var datas: [MessageCellModel] = {
       return []
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Message Center", comment: "")
        tableView.registerCellClass(MessageCell.self)
        tableView.setEmptyViewDelegate(target: self)

        
        tableView.tableHeaderView = headerView;
        tableView.tableFooterView = UIView()
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        
    }
}

extension MesgViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier, for: indexPath)
        // 系统通知
        // 阅读统计
        // 好书推荐
        return cell
    }
}

extension MesgViewController: EmptyProtocol {
    func configEmptyView(tableView: UITableView) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.height/2-100, width: UIScreen.width, height: 80))
        label.text = NSLocalizedString("No data", comment: "")
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: 0xd4d4d4)
        label.textAlignment = .center
        return label
    }
    var isEmpty: Bool {
        datas.count == 0
    }
}
