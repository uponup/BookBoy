//
//  NotesViewController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/3/22.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit
import TMCamera

class NotesViewController: ViewController {
    var notes: [Note] = []

    var bookId: Int? {
        didSet {
            if let id = bookId {
                notes.append(contentsOf: NoteDao.fetchNote(id))
            }
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let book = BookDao.fetchBook(bookId.intValue) {
            title = book.title
        }else {
            title = NSLocalizedString("Notes", comment: "")
        }
        
        collectionView.registerCellClass(NoteCell.self)
        collectionView.setEmptyDelegate(target: self)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        addBtn.setTitle(NSLocalizedString("Add", comment: ""), for: .normal)
        
        loadData()
    }
    //MARK:- LoadData -
    func loadData() {
        for _ in 0..<0 {
            let note = Note.test()
            notes.append(note)
        }
        collectionView.reloadData()
    }
    //MARK:- Action -
    @IBAction func addBtnAction(_ sender: Any) {
        let actionCamera = UIAlertAction(title: NSLocalizedString("Add from Camera", comment: ""), style: .default) { [unowned self] _ in
            
        }
        let actionAdd = UIAlertAction(title: NSLocalizedString("Add by manual", comment: ""), style: .default) { [unowned self] _ in
            let noteDetail = NoteDetailViewController()
            self.navigationController?.pushViewController(noteDetail, animated: true)
        }
        let actionCancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        
        let alert = UIAlertController(title: NSLocalizedString("Choose an Action", comment: ""), message: nil, preferredStyle: .actionSheet)
        alert.addAction(actionCamera)
        alert.addAction(actionAdd)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
}

extension NotesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return notes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCell.identifier, for: indexPath) as! NoteCell
        let note = notes[indexPath.row]
        cell.model = note
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 40
        return CGSize(width: width, height: 74)
    }
}


extension NotesViewController: EmptyCollectionProtocol {
    var isEmpty: Bool {
        notes.count == 0
    }
    
    func configEmptyView(collectionView: UICollectionView) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.height/2-100, width: collectionView.width-40, height: 80))
        label.text = NSLocalizedString("暂无数据", comment: "")
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: 0xd4d4d4)
        label.textAlignment = .center
        return label
    }
}

extension NotesViewController: TMCameraControllerDelegate {

    func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            print("没有拍照权限")
            return
        }
        let cameraVc = TMCameraController()
        cameraVc.delegate = self
        self.present(cameraVc, animated: true, completion: nil)
    }
    
    // MARK:- TMCameraControllerDelegate
    func cameraVc(_ camera: TMCameraController, takesPhoto image: UIImage) {
        let provider = OCRProvider(deactImage: image) { result in
            print("扫描结果：\(result)")
        }
        provider.scan()
    }
    
    func cameraVc(_ camera: TMCameraController, authFailed status: TMCameraAuthStatus) {
        
    }
}
