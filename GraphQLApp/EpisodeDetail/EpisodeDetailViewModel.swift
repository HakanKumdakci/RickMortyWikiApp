//
//  EpisodeDetailViewModel.swift
//  GraphQLApp
//
//  Created by Hakan on 10.07.2022.
//

import RxSwift
import RxCocoa

class EpisodeDetailViewModel: NSObject {

    var id: String = "0"
    var title: String
    var localCharacters : [Character] = []
    
    
    let characters: BehaviorRelay<[Character]> = BehaviorRelay(value: [])
    
    init(id: String, title: String){
        self.id = id
        self.title = title
    }
    
    
    func getCharacters(){
        let m:Int? = Int(self.id)
        Network.shared.apollo.fetch(query: DenemeQuery(id: self.id)) {result in
            
            switch result{
            
            case .success(let graphlQLResult):
                
                
                DispatchQueue.main.async {
                    var arr: [Character] = []
                    for i in 0..<((graphlQLResult.data?.episode?.characters.count)!) {
                        
                        let x = graphlQLResult.data?.episode?.characters[i]
                        
                        do{
                            let json = try JSONSerialization.data(withJSONObject: x?.resultMap)
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .useDefaultKeys
                            let obj = try decoder.decode(Character.self, from: json)
                            arr.append(obj)
                        }catch(let error){
                            print(error)
                        }
                        
                    }
                    self.localCharacters = arr
                    self.characters.accept(arr)
                }
                                
            case .failure(let m):
                print(m)
            }
        }
    }
    
}
