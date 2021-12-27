//
//  ViewController.swift
//  swift-location-sample
//
//  Created by ycsong on 2021/12/27.
//

import UIKit

class ViewController: UIViewController {

    let ls = LocationService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ls.requestAlwaysLocation()
    }
}

