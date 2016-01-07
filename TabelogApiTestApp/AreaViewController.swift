//
//  AreaViewController.swift
//  TabelogApiTestApp
//
//  Created by n.katou on 2016/01/05.
//  Copyright © 2016年 crhios. All rights reserved.
//

import UIKit
import Alamofire

class AreaViewController: UIViewController {

    @IBOutlet var AreaTableView: UITableView!
    var json:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.getAreaData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getAreaData(){
        
        Alamofire.request(.GET, "http://api.gnavi.co.jp/master/AreaSearchAPI/20150630/", parameters: ["keyid": "46a99b5ed41ca34eaf2a5e0ccdc00d0d", "format":"json", "lang":"ja"])
            .responseJSON { response in
                self.json = response.result.value!["area"] as! NSArray
                print(self.json)
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
