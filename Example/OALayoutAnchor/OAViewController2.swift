//
//  OAViewController2.swift
//  OALayoutAnchor
//
//  Created by Omar Abdelhafith on 04/07/2015.
//  Copyright © 2015 Omar Abdelhafith. All rights reserved.
//

import UIKit

class OAViewController2: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    let view1 = UIView()
    view1.backgroundColor = UIColor.blueColor()
    
    view1.setTranslatesAutoresizingMaskIntoConstraints(false)
    self.view.addSubview(view1)
    view1.oa_widthAnchor.constraintEqualToConstant(100).oa_active = true
    view1.oa_heightAnchor.constraintEqualToConstant(100).oa_active = true
    view1.oa_centerXAnchor.constraintEqualToAnchor(self.view.oa_centerXAnchor).oa_active = true
    view1.oa_centerYAnchor.constraintEqualToAnchor(self.view.oa_centerYAnchor).oa_active = true    
  }
}
