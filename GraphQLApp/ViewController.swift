//
//  ViewController.swift
//  GraphQLApp
//
//  Created by Akakce on 18.08.2021.
//

import UIKit
import Apollo
import SideMenu






class ViewController: UIViewController {
    
    
    var menu: SideMenuNavigationController? = {
        var menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu.leftSide = true
        return menu
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        title = "Ana Sayfa"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Menu", style: .plain, target: self, action: #selector(self.didTapMenu))
        
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
        
    }
    
    @objc func getMenu(){
        print()
    }
    
    
    @objc func didTapMenu(){
        present(menu!, animated: true)
    }
    
    
    func networkRequest(){
        
        Network.shared.apollo.fetch(query: RickMortyQuery()) {result in
            
            switch result{
                
            case .success(let graphlQLResult):
                
                for i in graphlQLResult.data?.episodesByIds![0]?.characters ?? []{
                    print(i?.name)
                }
                
                //print(graphlQLResult.data?.episodesByIds![0]?.characters[0])
                print()
                
            case .failure(let m):
                print(m)
            }
        }
    }
}


class MenuListController: UITableViewController{
    
    var items = ["Episodes", "Characters", "Locations"]
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = darkColor
        tableView.separatorStyle = .none
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor.clear
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = darkColor
        tableView.reloadRows(at: [indexPath], with: .fade)
//        let vc = Epi()
//        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
