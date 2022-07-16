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
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
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
    private var titleOfOrigin: UILabel = {
        var label = UILabel()
        label.text = "Origin: "
        label.font = UIFont(name: "Avenir-Heavy", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private var titleOfLocation: UILabel = {
        var label = UILabel()
        label.text = "Location: "
        label.font = UIFont(name: "Avenir-Heavy", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private lazy var originButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 18
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.tintColor = .black
        button.titleLabel?.numberOfLines = 0
        button.setTitle("", for: .normal)
        button.titleLabel?.leadingToSuperview(offset: 8)
        button.titleLabel?.trailingToSuperview(offset: 8)
        button.addTarget(self, action: #selector(navigateToLocation(sender:)), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    private lazy var  locationButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 18
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.tintColor = .black
        button.setTitle("", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.addTarget(self, action: #selector(navigateToLocation(sender:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    private var titleOfEpisodes: UILabel = {
        var label = UILabel()
        label.text = "Episodes that this character being in: "
        label.font = UIFont(name: "Avenir-Heavy", size: 21.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var episodeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 6.0
        layout.itemSize = CGSize(width: 128, height: 64)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.allowsMultipleSelection = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(EpisodeCollectionViewCell.self, forCellWithReuseIdentifier: EpisodeCollectionViewCell.identifier)
        return collectionView
    }()
    
    
    
    private var infoStackView : UIStackView = {
        var stackView = UIStackView()
        return stackView
    }()
    
    var viewModel: CharacterDetailPageViewModel
    
    init(viewModel: CharacterDetailPageViewModel){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getDetail()
        guard let url = URL(string: viewModel.character.image ?? "") else {return }
        
        characterImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholderImage"))
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
        view.addSubview(titleOfOrigin)
        view.addSubview(titleOfLocation)
        view.addSubview(originButton)
        view.addSubview(locationButton)
        view.addSubview(titleOfEpisodes)
        view.addSubview(episodeCollectionView)
        
        listenObject()
        
        viewModel.episodes.bind(to: episodeCollectionView.rx.items(cellIdentifier: EpisodeCollectionViewCell.identifier, cellType: EpisodeCollectionViewCell.self)){
            row, model, cell in
            cell.configure(model: self.viewModel.episodes.value[row])
        }.disposed(by: disposeBag!)
        
        
        episodeCollectionView.rx.modelSelected(Episode.self).bind{ episode in
            guard let id = episode.id,
                  let episodeCount = episode.episode,
                  let name = episode.name else { return }
            let vc = EpisodeDetail(viewModel: EpisodeDetailViewModel(id: id, title: "\(episodeCount) \(name)"))
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    @objc func navigateToLocation(sender: UIButton){
        viewModel.prepareLocationDetailViewModel(tag: sender.tag)
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
        
        characterStatus.attributedText = setUpAttributedText(message: "Status: ", imageName: characterDetail.status == "Alive" ? "alive" : "dead")
        
        characterSpecies.text = "Species: \(characterDetail.species)"
        characterType.text = "Type: \(characterDetail.type)"
        characterGender.text = "Gender: \(characterDetail.gender)"
        characterCreated.text = "Created at: \(characterDetail.created)"
        
        self.title = "\(characterDetail.name)"
        if let location = characterDetail.location, let id = location.id, let name = location.name {
            locationButton.setTitle("\(name)", for: .normal)
        }else{
            locationButton.setTitle("Unknown", for: .normal)
            locationButton.isUserInteractionEnabled = false
        }
        
        if let location = characterDetail.origin, let id = location.id, let name = location.name {
            originButton.setTitle("\(name)", for: .normal)
        }else{
            originButton.setTitle("Unknown", for: .normal)
            originButton.isUserInteractionEnabled = false
        }
        
        viewModel.episodes.accept(characterDetail.episode)
        
        
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
        characterImageView.topToSuperview(offset: 0, usingSafeArea: true)
        characterImageView.leadingToSuperview(offset: 16)
        characterImageView.width(self.view.frame.width*5/10)
        characterImageView.height(self.view.frame.width*5/10)
        
        characterStatus.topToSuperview(offset: 32, usingSafeArea: true)
        characterStatus.leadingToTrailing(of: characterImageView, offset: 16)
        characterStatus.trailingToSuperview(offset: 16)
        
        characterSpecies.topToBottom(of: characterStatus, offset: 8)
        characterSpecies.leading(to: characterStatus)
        characterSpecies.trailing(to: characterStatus)
        
        characterType.topToBottom(of: characterSpecies, offset: 8)
        characterType.leading(to: characterStatus)
        characterType.trailing(to: characterStatus)
        
        characterGender.topToBottom(of: characterType, offset: 8)
        characterGender.leading(to: characterStatus)
        characterGender.trailing(to: characterStatus)
        
        characterCreated.topToBottom(of: characterGender, offset: 8)
        characterCreated.leading(to: characterStatus)
        characterCreated.trailing(to: characterStatus)
        
        titleOfOrigin.topToBottom(of: characterImageView, offset: 48)
        titleOfOrigin.leadingToSuperview(offset: 16)
        titleOfOrigin.height(24)
        titleOfOrigin.width(96)
        
        titleOfLocation.top(to: titleOfOrigin)
        titleOfLocation.leadingToTrailing(of: titleOfOrigin, offset: 36)
        titleOfLocation.height(24)
        titleOfLocation.width(96)
        
        originButton.topToBottom(of: titleOfOrigin, offset: 16)
        originButton.leading(to: titleOfOrigin)
        originButton.width(96)
        originButton.height(96)
        
        locationButton.topToBottom(of: titleOfOrigin, offset: 16)
        locationButton.leading(to: titleOfLocation)
        locationButton.width(96)
        locationButton.height(96)
        
        titleOfEpisodes.topToBottom(of: originButton, offset: 16)
        titleOfEpisodes.leadingToSuperview(offset: 16)
        titleOfEpisodes.trailingToSuperview(offset: 16)
        titleOfEpisodes.height(36)
        
        episodeCollectionView.topToBottom(of: titleOfEpisodes, offset: 12)
        episodeCollectionView.leadingToSuperview(offset: 8)
        episodeCollectionView.trailingToSuperview(offset: 8)
        episodeCollectionView.height(64)
        
    }
}

