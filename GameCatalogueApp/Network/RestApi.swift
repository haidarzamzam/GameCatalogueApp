//
//  RestApi.swift
//  GameCatalogueApp
//
//  Created by Haidar Zamzam on 12/07/20.
//  Copyright © 2020 Haidar Zamzam. All rights reserved.
//

import Foundation

class RestApi {
    
    let base_url = "https://api.rawg.io/api/"
    
    func fetchListGame(callback: @escaping ((Result<GameModel, Error>) ->Void)) {
        
        let url = URL(string: base_url + "games")
        
        URLSession.shared.dataTask(with: url!) { (data, urlResponse, error) in
            if let error = error {
                callback(.failure(error))
                return
            }
            
            do{
                let game = try JSONDecoder().decode(GameModel.self, from: data!)
                callback(.success(game))
            }catch{
                callback(.failure(error))
            }
        }.resume()
    }
}

