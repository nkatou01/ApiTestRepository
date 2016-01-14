//
//  AreaViewController.swift
//  TabelogApiTestApp
//
//  Created by n.katou on 2016/01/05.
//  Copyright © 2016年 crhios. All rights reserved.
//

import UIKit
import Alamofire

class AreaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var areaTableView: UITableView!
    let apiUrl:String = "http://api.gnavi.co.jp/master/AreaSearchAPI/20150630/"
    private var json:NSArray!
    private var selectedAreaName:String!
    private var selectedAreaCode:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "エリアを選ぶ"
        self.areaTableView.delegate = self
        self.areaTableView.dataSource = self
        
        self.getAreaData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セクションごとのレコード数を返す
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json == nil ? 0 : json.count
    }
    
    //各セルの内容を返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "areaCell")
//        let cell:CustomViewCell = self.areaTableView.dequeueReusableCellWithIdentifier("CustomViewCell")! as! CustomViewCell
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if json[indexPath.row]["area_name"] == nil {
            return cell
        }
        
        cell.textLabel?.text = json[indexPath.row]["area_name"] == nil ? "-" : json[indexPath.row]["area_name"] as! String
        
        return cell
    }
    
    //セルを選択した時の処理
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectedAreaCode = self.json[indexPath.row]["area_code"] as! String
        self.selectedAreaName = self.json[indexPath.row]["area_name"] as! String
        performSegueWithIdentifier("pushPrefView", sender: nil)
    }
    
    // Segueで遷移時の処理
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "pushPrefView") {
            let prefView: PrefViewController = (segue.destinationViewController as? PrefViewController)!
            
            prefView.setSelectedAreaCode(self.selectedAreaCode)
            prefView.setSelectedAreaName(self.selectedAreaName)
        }
    }
    
    func getAreaData(){
        
        Alamofire.request(.GET, apiUrl, parameters: ["keyid": "46a99b5ed41ca34eaf2a5e0ccdc00d0d", "format":"json", "lang":"ja"])
            .responseJSON { response in
                //print(response.result.value)
                self.json = response.result.value!["area"] as! NSArray
                self.areaTableView.reloadData()
            }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
