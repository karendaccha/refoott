//
//  ViewControl.swift
//  Refoott
//
//  Created by KAREN on 2016/08/05.
//  Copyright © 2016年 KAREN. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var Tests:[Test] = [Test]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setupFriends()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "CustomCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupFriends() {
        let f1 = Test(label1: "Ken", label2:"kwen2ksfasdjfioasdfjioafd")
        let f2 = Test(label1: "Ken", label2:"kwen2askdfjaksdfa")
        let f3 = Test(label1: "Ken", label2:"kwen2asdfkasdfuew")
        let f4 = Test(label1: "Ken", label2:"kwen2ksfasdjfioasdfjioafd")
        let f5 = Test(label1: "Ken", label2:"kwen2askdfjaksdfa")
        let f6 = Test(label1: "Ken", label2:"kwen2asdfkasdfuew")
        
        Tests.append(f1)
        Tests.append(f2)
        Tests.append(f3)
        Tests.append(f4)
        Tests.append(f5)
        Tests.append(f6)
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