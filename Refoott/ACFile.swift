//
//  ACFile.swift
//  Refoott
//
//  Created by KAREN on 2016/08/03.
//  Copyright © 2016年 KAREN. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import AssetsLibrary

class ACViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var titleField1: UITextField!
    @IBOutlet var titleField2: UITextField!
    @IBOutlet var titleField3: UITextField!
    @IBOutlet var titleField4: UITextField!
    @IBOutlet var titleField5: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var Tests:[Test] = [Test]()
    var post: Post!
    
    /* func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 10
     }
     
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
     let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
     cell.textLabel?.text = ""
     return cell
     }*/
    
    
    
    //@IBOutlet var tableView: UITableView!
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var ageTextField: UITextField!
    @IBOutlet var hTextField: UITextField!
    @IBOutlet weak var imageFromCameraRoll: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*titleField1.text = saveData.objectForKey("title1") as?
         //String
         titleField2.text = saveData.objectForKey("title2") as?
         String
         titleField3.text = saveData.objectForKey("title3") as?
         String
         titleField4.text = saveData.objectForKey("title4") as?
         String
         titleField5.text = saveData.objectForKey("title5") as?
         String*/
        
        self.setupFriends()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        //imageFromCameraRoll.contentMode = .ScaleAspectFit
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var photoImageView: UIImageView!
    
    func presentPickerController(sourceType: UIImagePickerControllerSourceType){
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let picker = UIImagePickerController()
            
            picker.sourceType = sourceType
            
            picker.delegate = self
            
            self.presentViewController(picker, animated: true, completion:  nil)
            
        }
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: nil)
        
        photoImageView.image = image
    }
    @IBAction func selectButtonTapped(sender: UIButton){
        let alertController = UIAlertController(title: "画像の取得先を選択", message: nil, preferredStyle: .ActionSheet)
        
        let firstAction = UIAlertAction(title: "カメラ", style: .Default){
            action in
            self .presentPickerController(.Camera)
        }
        let secoundAction = UIAlertAction(title: "アルバム", style:  .Default){
            action in
            self .presentPickerController(.PhotoLibrary
            )
        }
        let cancelActioln = UIAlertAction(title: "キャンセル", style: .Cancel, handler: nil)
        
        alertController.addAction(firstAction)
        alertController.addAction(secoundAction)
        alertController.addAction(cancelActioln)
        
        presentViewController(alertController,animated: true, completion: nil)
        
    }
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    /*@IBAction func saveMemo(){
     saveData.setObject (titleField1.text, forKey: "title1")
     saveData.setObject (titleField2.text, forKey: "title2")
     saveData.setObject (titleField3.text, forKey: "title3")
     saveData.setObject (titleField4.text, forKey: "title4")
     saveData.setObject (titleField5.text, forKey: "title5")
     saveData.synchronize()
     let alert = UIAlertController(title: "保存",
     message: "プロフィールの保存が完了しました",
     preferredStyle: UIAlertControllerStyle.Alert)
     
     alert.addAction(
     UIAlertAction(
     title: "😊",
     style: UIAlertActionStyle.Default,
     handler: {action in
     
     self.navigationController?.popViewControllerAnimated(true)
     
     NSLog("😊ボタンが押されました")
     }))
     presentViewController(alert, animated: true, completion: nil)
     
     
     }
     func textFieldShouldReturn(textField: UITextField) -> Bool {
     textField.resignFirstResponder()
     return true
     }*/
    
    
    
    
    func setupFriends() {
        Tests = []
        let f1 = Test(label1: "なまえ", label2:"kwen2ksfasdjfioasdfjioafd")
        let f2 = Test(label1: "ねんれい", label2:"kwen2askdfjaksdfa")
        let f3 = Test(label1: "せいべつ", label2:"kwen2asdfkasdfuew")
        let f4 = Test(label1: "自己紹介", label2:"kwen2ksfasdjfioasdfjioafd")
        let f5 = Test(label1: "なんの", label2:"kwen2askdfjaksdfa")
        let f6 = Test(label1: "どのくらいかかる", label2:"kwen2asdfkasdfuew")
        
        Tests.append(f1)
        Tests.append(f2)
        Tests.append(f3)
        Tests.append(f4)
        Tests.append(f5)
        Tests.append(f6)
    }
    
    
    @IBAction func saveTapped(sender: UIButton) {
        setupFriends()
        tableView.reloadData()
    }
    func saveMemo(){
        
        saveData.synchronize()
        let alert = UIAlertController(title: "保存",
                                      message: "プロフィールの保存が完了しました",
                                      preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(
            UIAlertAction(
                title: "😊",
                style: UIAlertActionStyle.Default,
                handler: {action in
                    
                    self.navigationController?.popViewControllerAnimated(true)
                    
                    NSLog("😊ボタンが押されました")
            }))
        presentViewController(alert, animated: true, completion: nil)
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return Tests.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? CustomCell
        
        //cell中身セット（引数　セル、indexPath）
        cell?.setCell(Tests[indexPath.row])
        
        return cell!
        
        
    }
    
    
}