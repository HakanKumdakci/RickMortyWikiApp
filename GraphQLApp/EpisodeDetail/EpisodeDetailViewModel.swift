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
    var localCharacters : [Character] = []
    
    
    let characters: BehaviorRelay<[Character]> = BehaviorRelay(value: [])
    
    init(id: String){
        self.id = id
    }
    
    
    func getCharacters(){
        let m:Int? = Int(self.id)
        Network.shared.apollo.fetch(query: DenemeQuery(id: self.id)) {result in
            
            switch result{
            
            case .success(let graphlQLResult):
                
                
                DispatchQueue.main.async {
                    print()
                    var arr: [Character] = []
                    for i in 0..<((graphlQLResult.data?.episode?.characters.count)!) {
                        
                        let x = graphlQLResult.data?.episode?.characters[i]
                        let m = x?.id
                        let c: Character = Character(id: (x?.id)!, name: (x?.name)!, status: (x?.status)!, species: (x?.species)!, type: (x?.type)!, gender: (x?.gender)!, image: (x?.image)!)
                        print(x?.image)
                        arr.append(c)
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
