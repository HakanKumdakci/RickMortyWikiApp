//
//  EpisodeViewModel.swift
//  GraphQLApp
//
//  Created by Hakan on 9.07.2022.
//

import UIKit
import RxSwift
import RxCocoa


class EpisodeViewModel: NSObject {
    
    var episodes: BehaviorRelay<[Episode]> = BehaviorRelay(value: [])
    //GraphQLQuery
    
    
    
    func getEpisodes() {
        var m: [Episode] = []
        
        Network.shared.apollo.fetch(query: EpisodeQueryQuery()) {result in
            switch result{
            case .success(let graphlQLResult):
                for i in 0..<(graphlQLResult.data?.episodesByIds!.count)!{
                    guard let data = graphlQLResult.data?.episodesByIds![i]?.resultMap as? [String: Any] else {continue }
                    do{
                        let json = try JSONSerialization.data(withJSONObject: data)
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .useDefaultKeys
                        let obj = try decoder.decode(Episode.self, from: json)
                        m.append(obj)
                    }catch{
                        print("error")
                    }
                
                }
                self.episodes.accept(m)
                
            case .failure(let m):
                print(m)
            }
        }
    }
    
}
