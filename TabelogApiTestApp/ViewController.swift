//
//  ViewController.swift
//  TabelogApiTestApp
//
//  Created by n.katou on 2016/01/04.
//  Copyright © 2016年 crhios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    
    @IBOutlet var tableView: UITableView!
    var textField = UITextField()
    //@IBOutlet weak var textField: UITextField!
    
    let categories = ["検索"," "]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "ぐるなゔぃ"
        
        self.tableView.registerClass(CustomViewCell.classForCoder(), forCellReuseIdentifier: "CustomViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.view.addSubview(self.tableView)
        
        self.textField.delegate = self
        self.textField.borderStyle = UITextBorderStyle.RoundedRect
        self.textField.layer.borderWidth = 2
        self.textField.layer.borderColor = UIColor.blueColor().CGColor
        self.textField.keyboardType = .Default
        self.textField.placeholder = "フリーワード"
        
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    //セクションの数を返す
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return categories.count
    }
    
    //section番目の名前を返す
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    //各セクションごとのリストの総数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        default:
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
        if(indexPath.section == 0 && indexPath.row == 0) {
            return nil
        }
        
        return indexPath
    }
    
    //各項目リストの内容を決める
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:CustomViewCell = self.tableView.dequeueReusableCellWithIdentifier("CustomViewCell")! as! CustomViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        switch indexPath.section {
        case 0:
            let cellWidth = cell.contentView.frame.width
            let cellHeight = cell.contentView.frame.height
            
            self.textField.frame = CGRectMake(8,0,cellWidth,cellHeight)
            cell.contentView.addSubview(self.textField)
            cell.accessoryType = UITableViewCellAccessoryType.None
        case 1:
            cell.textLabel?.text = "エリアを選ぶ"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        default:
            break
        }
        
        return cell
    }
    
    //各項目リストを選択した時の動作
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //TODO
        performSegueWithIdentifier("pushAreaView", sender: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.textField.resignFirstResponder()
        return true
    }
    
//    @IBAction func tapScreen(sender: UITapGestureRecognizer) {
//        //画面タップでキーボードを閉じる
//        self.view.endEditing(true)
//    }
    
}

