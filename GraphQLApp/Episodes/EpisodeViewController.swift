//
//  Episodes.swift
//  GraphQLApp
//
//  Created by Akakce on 18.08.2021.
//

import UIKit
import RxSwift
import RxCocoa



class EpisodeViewController: UIViewController {
    
    private var disposeBag : DisposeBag? = {
        return DisposeBag()
    }()
    
    private var viewModel: EpisodeViewModel!
    
    private lazy var episodeTableView: UITableView! = {
        var table = UITableView(frame: .zero)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.layer.cornerRadius = 18
        table.layer.borderColor = UIColor.black.cgColor
        table.layer.borderWidth = 1
        return table
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getEpisodes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(episodeTableView)
        viewModel = EpisodeViewModel()
        
        //cell for row at
        viewModel.episodes.bind(to: episodeTableView.rx.items(cellIdentifier: "cell")) { row, model, cell in
            cell.textLabel?.text = model.name
        }.disposed(by: disposeBag!)
        
        //did select row at
        episodeTableView.rx.modelSelected(Episode.self).bind{ episode in
            guard let id = episode.id,
                  let episodeCount = episode.episode,
                  let name = episode.name else { return }
            let vc = EpisodeDetail(viewModel: EpisodeDetailViewModel(id: id))
            
            vc.title = "\(episodeCount) \(name)"
            self.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: disposeBag!)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        episodeTableView.edgesToSuperview(insets: UIEdgeInsets(top: 16, left: 16, bottom: -16, right: 16), usingSafeArea: true)
    }
    
}
