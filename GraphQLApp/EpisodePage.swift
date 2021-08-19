//
//  EpisodePage.swift
//  GraphQLApp
//
//  Created by Akakce on 19.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class EpisodePage: UIViewController {
    var id: String = "0"
    var localCharacters : [Character] = []
    var images: [ImageOfCharacters] = []
    let characters: BehaviorRelay<[Character]> = BehaviorRelay(value: [
        Character(id: "2", name: "dd", status: "", species: "", type: "", gender: "", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    ])
    
    
    var disposeBag : DisposeBag? = {
        return DisposeBag()
    }()
    
    var tableView: UITableView? = {
        var table = UITableView(frame: .zero)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    var isLoaded:Bool? = false
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.characters.accept(self.localCharacters)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView!)
        tableView?.frame = view.bounds
        
        tableView?.rowHeight = 100
        
        characters.bind(to: tableView!.rx.items(cellIdentifier: "cell")) { [self] row, model, cell in
            
            cell.textLabel?.text = model.name

            if images.count != 0{
                for i in images{
                    if i.id == model.id{
                        if let image = i.img as? UIImage{
                            cell.imageView?.image = image
                        }
                    }
                }
                self.isLoaded = true
            }
            
        }.disposed(by: disposeBag!)
        
        
        tableView!.rx.modelSelected(Character.self).bind{ character in
            print()
        }.disposed(by: disposeBag!)
        
        getCharacters()
        
        // Do any additional setup after loading the view.
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
                        
                        DispatchQueue.global().async { [weak self] in
                            if let datax = try? Data(contentsOf: URL(string: (x?.image)!)!) {
                                if let image = UIImage(data: datax) {
                                    DispatchQueue.main.async {
                                        self?.images.append(ImageOfCharacters(img: image, id: (x?.id!)!))
                                    }
                                }
                            }
                        }
                        
                        arr.append(c)
                        print()
                    }
                    self.localCharacters = arr
                    self.characters.accept(arr)
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
