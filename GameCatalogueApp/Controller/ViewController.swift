//
//  ViewController.swift
//  GameCatalogueApp
//
//  Created by Haidar Zamzam on 12/07/20.
//  Copyright © 2020 Haidar Zamzam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let restApi = RestApi()
        
        restApi.fetchListGame { (result) in
            switch result{
            case .success(let games):
                dump(games)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

