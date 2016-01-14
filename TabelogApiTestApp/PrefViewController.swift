//
//  PrefViewController.swift
//  TabelogApiTestApp
//
//  Created by n.katou on 2016/01/07.
//  Copyright © 2016年 crhios. All rights reserved.
//

import UIKit
import Alamofire

class PrefViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var prefTableView: UITableView!
    let apiUrl:String = "http://api.gnavi.co.jp/master/PrefSearchAPI/20150630/"
    private var json: NSArray!
    private var extJson = [AnyObject]()
    private var areaCode: String!
    private var areaName: String!
    
    func setSelectedAreaCode(code: String)->Void {
        self.areaCode = code
    }
    
    func setSelectedAreaName(name: String)->Void {
        self.areaName = name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = areaName
        self.getPrefData()
        
        self.prefTableView.delegate = self
        self.prefTableView.dataSource = self
        
        //print(self.areaCode)
        //print(self.areaName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.json == nil ? 0 : self.json.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "prefCell")
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if self.json[indexPath.row]["pref_code"] == nil {
            return cell
        }
        
        cell.textLabel?.text = self.json[indexPath.row]["pref_name"] == nil ? "-" : self.json[indexPath.row]["pref_name"] as! String
        
        return cell
    }

    
    func getPrefData(){
        
        Alamofire.request(.GET, apiUrl, parameters: ["keyid": "46a99b5ed41ca34eaf2a5e0ccdc00d0d", "format":"json", "lang":"ja"])
            .responseJSON { response in
                //print(response.result.value)
                for dt in response.result.value!["pref"] as! NSArray {
                    
                    if dt["area_code"] as! String == self.areaCode {
                        self.extJson.append(dt)
                    }
                    
                }
                
                self.json = self.extJson
                self.prefTableView.reloadData()
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
