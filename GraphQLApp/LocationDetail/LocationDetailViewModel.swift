//
//  LocationDetailViewModel.swift
//  GraphQLApp
//
//  Created by Hakan on 13.07.2022.
//

import Foundation
import RxCocoa
import RxSwift

class LocationDetailViewModel{
    var location: Location
    
    var locationDetail: BehaviorRelay<LocationDetail> = BehaviorRelay(value: LocationDetail(id: "", name: "", type: "", dimension: "", created: "", residents: []))
    
    init(model: Location){
        self.location = model
    }
    
    func getDetail(){
        guard let id = location.id else { return }
        Network.shared.apollo.fetch(query: LocationDetailQuery(id: id)) { [weak self] result in
            switch result{
                
            case .success(let graphlQLResult):
                guard let data = graphlQLResult.data?.resultMap.first?.value,
                      let self = self else {return }
                do{
                    let json = try JSONSerialization.data(withJSONObject: data)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .useDefaultKeys
                    let obj = try decoder.decode(LocationDetail.self, from: json)
                    self.locationDetail.accept(obj)
                }catch(let error){
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
