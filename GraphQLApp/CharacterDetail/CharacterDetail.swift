//
//  CharacterPage.swift
//  GraphQLApp
//
//  Created by Akakce on 19.08.2021.
//

import UIKit
import TinyConstraints
import RxSwift
import RxCocoa

class CharacterDetailPage: UIViewController {
    
    var disposeBag : DisposeBag! = {
        return DisposeBag()
    }()
    
    private var characterImageView: UIImageView! = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 18
        return imageView
    }()
    
    private var characterStatus: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var characterSpecies: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private var characterType: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private var characterGender: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private var characterCreated: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    
    
    private var infoStackView : UIStackView = {
        var stackView = UIStackView()
        
        return stackView
    }()
    
    
    var viewModel: CharacterDetailPageViewModel!
    
    
    init(id: String){
        viewModel = CharacterDetailPageViewModel(id: id)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getDetail()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(characterImageView)
        view.addSubview(characterType)
        view.addSubview(characterGender)
        view.addSubview(characterStatus)
        view.addSubview(characterCreated)
        view.addSubview(characterSpecies)
        
        listenObject()
        
    }
    
    func listenObject(){
        viewModel.characterDetail.asObservable()
            .subscribe { [weak self] characterDetail in
                self?.setUpView(characterDetail: characterDetail)
            } onError: { error in
                print(error)
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }.disposed(by: disposeBag)
    }
    
    func setUpView(characterDetail: CharacterDetail){
        guard let url = URL(string: characterDetail.image) else {return }
        
        characterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
        
        characterStatus.attributedText = setUpAttributedText(message: "Status: ", imageName: characterDetail.status == "Alive" ? "alive" : "dead")
        
        characterSpecies.text = "Species: \(characterDetail.species)"
        characterType.text = "Type: \(characterDetail.type)"
        characterGender.text = "Gender: \(characterDetail.gender)"
        characterCreated.text = "Created at: \(characterDetail.created)"
        
    }
    
    func setUpAttributedText(message: String, imageName: String) -> NSMutableAttributedString{
        let fullString = NSMutableAttributedString(string: message)
        
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(named: imageName)!
        image1Attachment.bounds = CGRect(x: 0, y: -8, width: 24, height: 24)
        
        let image1String = NSAttributedString(attachment: image1Attachment)
        
        fullString.append(image1String)
        
        return fullString
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        
    }
    
}


