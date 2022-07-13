//
//  CharacterDetailViewModel.swift
//  GraphQLApp
//
//  Created by Hakan on 10.07.2022.
//

import UIKit
import SDWebImage
import RxSwift
import RxCocoa

protocol CharacterDetailPageViewModelDelegate: AnyObject{
    func objectDidReturn()
}

class CharacterDetailPageViewModel: NSObject {
    
    var characterDetail: BehaviorRelay<CharacterDetail> = BehaviorRelay(value: CharacterDetail(id: "", name: "", status: "", species: "", type: "", gender: "", origin: Location(id: "", name: "", type: "", dimension: "", created: ""), location: Location(id: "", name: "", type: "", dimension: "", created: ""), episode: [], created: "", image: ""))
    
    
    var delegate: CharacterDetailPageViewModelDelegate?
    
    
    var id: String
    
    
    init(id: String){
        self.id = id
    }
    
    func getDetail(){
        let m:Int? = Int(self.id)
        Network.shared.apollo.fetch(query: CharacterDetailByIdQuery(id: self.id)) { [weak self] result in
            switch result{
                
            case .success(let graphlQLResult):
                guard let data = graphlQLResult.data?.resultMap,
                      let self = self else {return }
                do{
                    let json = try JSONSerialization.data(withJSONObject: data)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let obj = try decoder.decode(CharacterDetail.self, from: json)
                    self.characterDetail.accept(obj)
                }catch(let error){
                    print(error)
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
