//
//  CustomViewCell.swift
//  TabelogApiTestApp
//
//  Created by n.katou on 2016/01/05.
//  Copyright © 2016年 crhios. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell, UITextFieldDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
