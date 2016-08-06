//
//  TLViewController.swift
//  Refoott
//
//  Created by KAREN on 2016/06/11.
//  Copyright © 2016年 KAREN. All rights reserved.
//

import UIKit
import Firebase

// 投稿
class TKViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    var databaseRef:FIRDatabaseReference!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        nameTextField.delegate = self
        messageTextField.delegate = self
        
        //nameTextField.tag = 1
        //messageTextField.tag = 2
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        
        //let messageData = ["name": nameTextField.text!, "message": messageTextField.text!]
        //        textField.resignFirstResponder()
        
        
        //print("enter")
        
        if let name = nameTextField.text {
            if let message = messageTextField.text {
                
                // 両方とも入力されていたら投稿データを保存して
                databaseRef = FIRDatabase.database().reference()
                
                let messageData = ["name": nameTextField.text!, "message": messageTextField.text!]
                databaseRef.childByAutoId().setValue(messageData)
                
                textField.resignFirstResponder()
                messageTextField.text = ""
                
                
                print("保存")
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
        
        return true

    }
    
    //if let name = nameTextField.text {
    // if let message = messageTextField.text {
    //print("保存")
    
    
    //                let ud = NSUserDefaults.standardUserDefaults()
    //                ud.setValue(name, forKey: "name")
    //                ud.setValue(message, forKey: "message")
    //                ud.synchronize()
    
    // そうでなければ何もしないで
    //データ保存
    //一つ前に画面戻る
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


//
// import Foundation
// import UIKit
// import Firebase
//
// // 投稿
// class TKViewController: UIViewController,UITextFieldDelegate {
// var databaseRef:FIRDatabaseReference!
//
//
// @IBOutlet weak var textView: UITextView!
// @IBOutlet weak var nameTextField: UITextField!
// @IBOutlet weak var messageTextField: UITextField!
//
// override func viewDidLoad() {
// super.viewDidLoad()
// // Do any additional setup after loading the view, typically from a nib.
//
// nameTextField.delegate = self
// messageTextField.delegate = self
// databaseRef = FIRDatabase.database().reference()
//
// //tableView.dataSource = self
// databaseRef.observeEventType(.ChildAdded, withBlock: { snapshot in
// if let name = snapshot.value!.objectForKey("name") as? String,
// message = snapshot.value!.objectForKey("message") as? String {
// print("message==\(message)")
// print("name==\(name)")
// }
// })
// }
//
// func textFieldShouldReturn(textField: UITextField) -> Bool{
//
// let messageData = ["name": nameTextField.text!, "message": messageTextField.text!]
// databaseRef.childByAutoId().setValue(messageData)
//
// textField.resignFirstResponder()
// messageTextField.text = ""
// //一つ前に画面戻る
// dismissViewControllerAnimated(true, completion: nil)
//
// return true
// }
//
// override func didReceiveMemoryWarning() {
// super.didReceiveMemoryWarning()
// }
//
//
// }
//

