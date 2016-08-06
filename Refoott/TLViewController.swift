//
//  TLViewController.swift
//varefoott
//
//  Created by KAREN on 2016/06/11.
//  Copyright © 2016年 KAREN. All rights reserved.
//
import UIKit
import Firebase

// タイムライン tableView
class TLViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var databaseRef:FIRDatabaseReference!
    var postArray = [Post]() // 表示する投稿のリスト
    var selectedPost : Post!
    
    var arrayyy = [
        ["proflie","what","how","name","age","gender"],
        ["name","age","gender","profile","what","how"],
        ["gender","profile","what","how","name","age"],
        ["how","what","profile","gender","age","name"],
        ["age","gender","profile","what","how","name"],
        ["what","how","name","age","gender","profile"]
        ]
        
    
    /*
     storyboardにて
     label.tag = 1
     labelButton.tag = 2
     textfield.tag = 3
     button.tag = 4
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // データベースからpostArrayに追加
        loadData()
        
        
    }
    
    func loadData(){
        postArray = []
        
        //        let ud = NSUserDefaults.standardUserDefaults()
        //        let name = ud.objectForKey("name") as! String
        //        let message = ud.objectForKey("message") as! String
        databaseRef = FIRDatabase.database().reference()
        
        databaseRef.observeEventType(.ChildAdded, withBlock: { snapshot in
            if let name = snapshot.value!.objectForKey("name") as? String,
                message = snapshot.value!.objectForKey("message") as? String
            {
                let post = Post(name: name, message: message)
                self.postArray.append(post)
                
                //tableView更新
                self.tableView.reloadData()
                print(self.postArray)
            }
            
        })
        //tableView更新
//        self.tableView.reloadData()
//        print(self.postArray)
        
    }
    //tableview のcellの数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    
    //各セルの要素を設定する
    func tableView(table: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let cellLabel = table.viewWithTag(1) as! UILabel
        cellLabel.text = postArray[indexPath.row].name
        
//        let cellButton = table.viewWithTag(2) as! UIButton
//        cellButton.addTarget(self, action: "tappedCellLable:", forControlEvents: .TouchUpInside)
//        view.addSubview(cellButton)
        
        let cellMessage = table.viewWithTag(3) as! UITextView
        cellMessage.text = postArray[indexPath.row].message
        
        return cell
    }
    
    func tappedCellLable(sender: UIButton) {
        print("tappedLabelButton")
        
    }
    
    // Cell が選択された場合
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedPost = postArray[indexPath.row]
        
        if selectedPost != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toVC",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toVC") {
            let nextVC: ACViewController = (segue.destinationViewController as? ACViewController)!
            
            nextVC.post = selectedPost
        }
    }
}
/*
 
 import Foundation
 import UIKit
 import Firebase
 
 // タイムライン tableView
 class TLViewController: UIViewController,UITextFieldDelegate,UITextFieldDelegate,UITableViewDataSource {
 var databaseRef:FIRDatabaseReference!
 @IBOutlet var tableView: UITableView!
 var posts: [Post] = []
 var selectedPost: Post!
 var selectedImage: UIImage?
 override func viewDidLoad() {
 super.viewDidLoad()
 //
 //        let nib = UINib(nibName: "TLTableViewCell", bundle: nil)
 //        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
 
 tableView.delegate = self
 tableView.dataSource = self
 databaseRef = FIRDatabase.database().reference()
 
 //firebaseからとってくる
 databaseRef.observeEventType(.ChildAdded, withBlock: { snapshot in
 if let name = snapshot.value!.objectForKey("name") as? String,
 message = snapshot.value!.objectForKey("message") as? String
 {
 let post = Post(name: name, message: message)
 self.posts.append(post)
 }
 //tableView更新
 self.tableView.reloadData()
 })
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 }
 // ---------------------tableview----------------------------
 //tableview のcellの数
 func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return posts.count
 }
 
 //cellに値をセット
 func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 
 let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TLTableViewCell
 cell.nameLabel.text = posts[indexPath.row].name
 cell.messageLabel.text = posts[indexPath.row].message
 //        cell.labelButton =
 return cell
 }
 
 // Cell が選択された場合
 func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
 // [indexPath.row] から画像名を探し、UImage を設定
 selectedPost = UIImage(named:"\(posts[indexPath.row])")
 if selectedPost != nil {
 // SubViewController へ遷移するために Segue を呼び出す
 performSegueWithIdentifier("toSubViewController",sender: nil)
 }
 
 }
 
 // Segue 準備
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
 if (segue.identifier == "toSubViewController") {
 let subVC: SubViewController = (segue.destinationViewController as? SubViewController)!
 // SubViewController のselectedImgに選択された画像を設定する
 SubVC.selectedPost = selectedPost
 }
 }
 }
 
 */