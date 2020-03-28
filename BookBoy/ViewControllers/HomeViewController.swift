//
//  HomeViewController.swift
//  BookBoy
//
//  Created by 龙格 on 2020/2/25.
//  Copyright © 2020 Paul Gao. All rights reserved.
//

import UIKit
import SwiftyJSON
import Vision
import TMCamera
import SideMenu

class HomeViewController: ViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        loadData()
        NotificationCenter.default.addObserver(self, selector: #selector(didReceiveKeyboardChanged), name: UIApplication.keyboardWillShowNotification, object: nil)
    }

    @objc func leftButtonAction() {
        self.present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    
    @objc func didReceiveKeyboardChanged(_ notification: Notification) {
        print("\(notification)")
    }

    @IBAction func addExcerpt(_ sender: Any) {
        let actionCamera = UIAlertAction(title: NSLocalizedString("Add from Camera", comment: ""), style: .default) { [unowned self] _ in
            self.openCamera()
        }
        let actionAdd = UIAlertAction(title: NSLocalizedString("Add a Book", comment: ""), style: .default) { [unowned self] _ in
            self.addBook()
        }
        let actionCancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        
        let alert = UIAlertController(title: NSLocalizedString("Choose an Action", comment: ""), message: nil, preferredStyle: .actionSheet)
        alert.addAction(actionCamera)
        alert.addAction(actionAdd)
        alert.addAction(actionCancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Private Method -
    private func addBook() {
        let inputAlertView = InputAlertView.createFromNib()!
        inputAlertView.showWithBlock { [unowned self] (ret, text) in
            let book = Book(title: text)
            guard BookDao.addBook(book: book) else {
                print("插入book失败")
                return
            }
            print("插入book成功")
            self.loadData()
        }
    }
    
    //MARK:- LoadData -
    func loadData() {
        books.removeAll()

        let book = Book.add()
        books.append(book)
        let datas = BookDao.fetchAllBooks()
        books.append(contentsOf: datas)
        
        collectionView.reloadData()
    }
    
    func commonInit() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Image"), style: .plain, target: self, action: #selector(leftButtonAction))
        let menu = SideMenuNavigationController(rootViewController: SettingViewController())
        menu.isNavigationBarHidden = true
        menu.statusBarEndAlpha = 0
        menu.presentationStyle = .menuSlideIn
        menu.menuWidth = min(UIScreen.width, UIScreen.height)*0.65
        menu.presentationStyle.onTopShadowColor = UIColor.tmGray
        menu.presentationStyle.onTopShadowOpacity = 0.4
        menu.presentationStyle.onTopShadowRadius = 20
        menu.alwaysAnimate = true
        menu.dismissOnPush = true
        menu.animationOptions = .curveEaseInOut
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view)
        
        self.title = NSLocalizedString("Book List", comment: "")
        
        collectionView.registerCellClass(BookCell.self)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCell.identifier, for: indexPath) as! BookCell
        let book = books[indexPath.row]
        cell.model = book
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row==0 {
            // 创建
            addBook()
        }else {
            let book = books[indexPath.row]
            let notesVc = NotesViewController()
            notesVc.bookId = book.id
            self.navigationController?.pushViewController(NotesViewController(), animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 50) / 3
        return CGSize(width: width, height: 160)
    }
}

extension HomeViewController: TMCameraControllerDelegate {

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

