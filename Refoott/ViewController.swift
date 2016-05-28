//
//  ViewController.swift
//  Refoott
//
//  Created by KAREN on 2016/05/28.
//  Copyright © 2016年 KAREN. All rights reserved.
//

import UIKit
import Persei

class ViewController: UIViewController {

    @IBOutlet var tableview: UITableView!
    private weak var menu: MenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMenu()
    }
    
    private func loadMenu() {
        let menu = MenuView()
        menu.items = items
        tableview.addSubview(menu)
        self.menu = menu
    }
    
    // MARK: - Items
    private let items = (0..<5 as Range).map { i in
        MenuItem(image: UIImage(named: "huni.png")!)
    }
    
    // MARK: - Actions
    @IBAction private func switchMenu() {
        menu.setRevealed(!menu.revealed, animated: true)
    }
}
