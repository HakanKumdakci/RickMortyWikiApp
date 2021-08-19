//
//  Episodes.swift
//  GraphQLApp
//
//  Created by Akakce on 18.08.2021.
//

import UIKit
import RxSwift
import RxCocoa



class Episodes: UIViewController {
    
    let episodes: BehaviorRelay<[Episode]> = BehaviorRelay(value: [
        Episode(id: "1", name: "", air_date: "", episode: "", created: "")
    ])
    var disposeBag : DisposeBag? = {
        return DisposeBag()
    }()
    
    var tableView: UITableView? = {
        var table = UITableView(frame: .zero)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        view.addSubview(tableView!)
        tableView?.frame = view.bounds
        
        // Do any additional setup after loading the view.

        
        
        
        episodes.bind(to: tableView!.rx.items(cellIdentifier: "cell")) { row, model, cell in
            
            cell.textLabel?.text = model.name
        }.disposed(by: disposeBag!)
        
        
        tableView!.rx.modelSelected(Episode.self).bind{ episode in
            let vc = EpisodePage()
            vc.id = episode.id!
            vc.title = "\(episode.episode!) \(episode.name!)"
            self.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: disposeBag!)
        
        getEpisodes()
    }
    
    
    func getEpisodes() {
        Network.shared.apollo.fetch(query: EpisodeQueryQuery()) {result in
            
            switch result{
            
            case .success(let graphlQLResult):
                
                
                DispatchQueue.main.async {
                    print()
                    var m: [Episode] = []
                    for i in 0..<(graphlQLResult.data?.episodesByIds!.count)!{
                        
                        let x = graphlQLResult.data?.episodesByIds![i]?.resultMap as? [String: Any]
                        let n: Episode?
                        n = Episode(id: x!["id"] as! String , name: x!["name"] as! String , air_date: x!["air_date"] as! String, episode: x!["episode"] as! String, created: x!["created"] as! String)
                        if let n=n{
                            m.append(n)
                        }
                    }
                    self.episodes.accept(m)
                }
                                
            case .failure(let m):
                print(m)
            }
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
