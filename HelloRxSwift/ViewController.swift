//
//  ViewController.swift
//  HelloRxSwift
//
//  Created by Juan Bonforti on 16/01/2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Observable.from([1,2,3,4,5])
        
    }
}

