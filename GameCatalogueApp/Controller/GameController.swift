//
//  ViewController.swift
//  GameCatalogueApp
//
//  Created by Haidar Zamzam on 12/07/20.
//  Copyright © 2020 Haidar Zamzam. All rights reserved.
//

import UIKit

class GameController: UIViewController {

    @IBOutlet weak var gameTableView: UITableView!
    var dataGames = [GameModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let restApi = RestApi()
        restApi.fetchListGame { (result) in
            switch result{
            case .success(let games):
                dump(games)
                self.dataGames.append(games)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        gameTableView.dataSource = self
        
        gameTableView.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "GameCatalogCell")
    }
}

extension GameController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataGames.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Digunakan untuh menghubungkan cell dengan identifier "GameCatalogCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCatalogCell", for: indexPath) as! GameTableViewCell
        
        // Menetapkan nilai games ke view di dalam cell
        let games = dataGames[indexPath.row]
        cell.titleGame.text = games.results?[indexPath.row].name
        cell.dateGame.text = games.results?[indexPath.row].released
//        cell.imageGame.image = games?.backgroundImage
//
//        cell.imageGame.layer.cornerRadius = cell.imageGame.frame.height / 2
//        cell.imageGame.contentMode = .scaleAspectFill
        
        return cell
    }
}

