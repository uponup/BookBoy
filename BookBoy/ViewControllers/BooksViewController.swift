//
//  BooksViewController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/4/5.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class BooksViewController: ViewController {
    typealias SelectCompletion = (Int) -> (Void)
    
    @IBOutlet weak var tableView: UITableView!
    public var block: SelectCompletion!
    
    private var books: [Book] = {
        BookDao.fetchAllBooks()
    }()
    
    init(selectCompletion: @escaping SelectCompletion) {
        self.block = selectCompletion
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Select A Book", comment: "")
    }
}

extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: UITableViewCell.identifier)
        }
        let book = books[indexPath.row]
        cell!.textLabel?.text = book.title == "" ? NSLocalizedString("No Name Book", comment: "") : book.title
        cell!.detailTextLabel?.text = book.createDate.toString(with: .yyyyMMddHHmm)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = books[indexPath.row]
        block(book.id)
        self.dismiss(animated: true, completion: nil)
    }
}
