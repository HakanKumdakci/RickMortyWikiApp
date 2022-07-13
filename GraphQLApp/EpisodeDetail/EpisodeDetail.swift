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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(characterTableView)
        characterTableView.rowHeight = 100
        
        viewModel.characters.bind(to: characterTableView.rx.items(cellIdentifier: "cell")) { [self] row, model, cell in
            guard let url = URL(string: model.image) else { return }
            cell.imageView?.contentMode = .scaleAspectFill
            cell.imageView?.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholderImage"))
            cell.textLabel?.text = model.name
            
        }.disposed(by: disposeBag!)
        
        
        characterTableView.rx.modelSelected(Character.self).bind{ character in
            let vc = CharacterDetailPage(id: character.id)
//            self.navigationController?.pushViewController(vc, animated: true)
        }.disposed(by: disposeBag!)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        characterTableView.edgesToSuperview(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), usingSafeArea: true)
        
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

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        
                    }
                }
            }
        }
    }
}
