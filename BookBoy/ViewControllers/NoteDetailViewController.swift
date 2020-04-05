//
//  NoteDetailViewController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit

class NoteDetailViewController: ViewController {

    init(bookId: Int?, note: Note? = nil) {
        self.bookId = bookId
        self.note = note
        super.init(nibName: nil, bundle: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var tf: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelCount: UILabel!
    private var btnSave: UIButton!
    
    private var note: Note?
    private var bookId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Note Detail", comment: "")
        labelTitle.text = NSLocalizedString("Extract notes", comment: "")
        tf.placeholder = NSLocalizedString("", comment: "")
        view.addTapAction(#selector(tapAction), target: self)
        btnSave = UIButton(type: .system)
        btnSave.setTitle(NSLocalizedString("Save", comment: ""), for: .normal)
        btnSave.bounds = CGRect(x: 0, y: 0, width: 32, height: 44)
        btnSave.addTarget(self, action:  #selector(btnSaveAction), for: .touchUpInside)
        btnSave.setTitleColor(UIColor(hex: 0x000000, alpha: 0.8), for: .normal)
        btnSave.setTitleColor(UIColor(hex: 0x000000, alpha: 0.3), for: .disabled)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: btnSave)
        
        guard let note = self.note else {
            textView.text = "";
            refreshLabelCount()
            return
        }
        tf.text = note.title
        textView.text = note.content
        refreshLabelCount(note.content)
        refreshRightBarbuttonItem()
    }
    
    //MARK:- Reload -
    private func refreshRightBarbuttonItem() {
        guard let currentNote = self.note, currentNote.title == tf.text, currentNote.content == textView.text else {
            btnSave.isEnabled = true
            return
        }
        btnSave.isEnabled = false
    }
    
    private func refreshLabelCount(_ text: String = "") {
        labelCount.text = "\(NSLocalizedString("Word count:", comment: "")) \(text.count)"
    }
    
    //MARK:- Action -
    @objc func tapAction() {
        view.endEditing(true)
    }
    
    @objc func btnSaveAction() {
        view.endEditing(true)
        
        guard let currentBookId = bookId else {
            let booksVc = BooksViewController { [unowned self] in
                self.bookId = $0
            }
            self.present(booksVc, animated: true, completion: nil)
            return
        }
        
        guard let noteTitle = tf.text, noteTitle.count > 0 else {
            Hud.showErrorHit(NSLocalizedString("Title can't be nil", comment: ""))
            return
        }
        guard textView.text.count > 10 else {
            Hud.showErrorHit(NSLocalizedString("Content too short", comment: ""))
            return
        }
        
        if var note = self.note, NoteDao.isExistNote(note.id) {
            note.title = noteTitle
            note.content = textView.text
            note.updateDate = Date()
            NoteDao.updateNote(note: note)
        }else {
            let note = Note(currentBookId, noteTitle, textView.text)
            NoteDao.addNote(note: note)
        }
        Hud.showHit(NSLocalizedString("Add success", comment: ""))
    
        Thread.doOnDelay(1.5) {
            self.popWithAnimation()
        }
    }
    
    @IBAction func tfValueChanged(_ sender: Any) {
        refreshRightBarbuttonItem()
    }
}

extension NoteDetailViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        refreshRightBarbuttonItem()
        refreshLabelCount(textView.text)
    }
}
