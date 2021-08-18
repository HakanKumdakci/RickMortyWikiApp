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
    
    let episodes: BehaviorRelay<[String]> = BehaviorRelay(value: [
        "item","item", "item", "item", "item"
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
            
            cell.textLabel?.text = model
            cell.detailTextLabel?.text = model
        }.disposed(by: disposeBag!)
        
        
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
