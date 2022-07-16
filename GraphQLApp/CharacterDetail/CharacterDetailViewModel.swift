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
    
    
    var episodes: BehaviorRelay<[Episode]> = BehaviorRelay(value: [])
    
    var delegate: CharacterDetailPageViewModelDelegate?
    
    
    var character: Character
    
    init(character: Character){
        self.character = character
    }
    
    func getDetail(){
        
        Network.shared.apollo.fetch(query: CharacterDetailByIdQuery(id: self.character.id)) { [weak self] result in
            switch result{
                
            case .success(let graphlQLResult):
                guard let data = graphlQLResult.data?.resultMap.first?.value,
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
    
    func prepareLocationDetailViewModel(tag: Int){
        let model = tag == 0 ? characterDetail.value.origin : characterDetail.value.location
        let vc = LocationDetailViewController(viewModel: LocationDetailViewModel(model: model!))
        SessionSingleton.navigationController.pushViewController(vc, animated: true)
    }
    
    
    
}
