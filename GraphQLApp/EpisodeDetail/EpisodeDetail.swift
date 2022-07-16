//
//  EpisodePage.swift
//  GraphQLApp
//
//  Created by Akakce on 19.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class EpisodeDetail: UIViewController {
    
    var disposeBag : DisposeBag? = {
        return DisposeBag()
    }()
    
    private lazy var characterTableView: UITableView! = {
        var table = UITableView(frame: .zero)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var viewModel: EpisodeDetailViewModel
    
    init(viewModel: EpisodeDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        viewModel.getCharacters()
    }
    
    private func configureNavigationTitle(_ title: String) {
            let tempLabel = UILabel()
            tempLabel.font = UIFont.systemFont(ofSize: 34, weight: .bold)
            tempLabel.text = title

            if tempLabel.intrinsicContentSize.width > UIScreen.main.bounds.width - 30 {
                var currentTextSize: CGFloat = 34
                for _ in 1 ... 34 {
                    currentTextSize -= 1
                    tempLabel.font = UIFont.systemFont(ofSize: currentTextSize, weight: .bold)
                    if tempLabel.intrinsicContentSize.width < UIScreen.main.bounds.width - 30 {
                        break
                    }
                }
                navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: currentTextSize, weight: .bold)]
            }
            self.title = title
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.configureNavigationTitle(viewModel.title)
        view.addSubview(characterTableView)
        characterTableView.rowHeight = 100
        
        viewModel.characters.bind(to: characterTableView.rx.items(cellIdentifier: "cell")) { [weak self] row, model, cell in
            guard let url = URL(string: model.image) else { return }
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.layer.cornerRadius = 9
            cell.imageView?.layer.masksToBounds = true
            cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholderImage"))
            cell.textLabel?.text = model.name
            
        }.disposed(by: disposeBag!)
        
        
        characterTableView.rx.modelSelected(Character.self).bind{ character in
            let vc = CharacterDetailPage(viewModel: CharacterDetailPageViewModel(character: character))
            self.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: disposeBag!)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        characterTableView.edgesToSuperview(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), usingSafeArea: true)
        
    }

}
