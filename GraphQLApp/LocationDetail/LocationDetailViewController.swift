//
//  LocationDetailViewController.swift
//  GraphQLApp
//
//  Created by Hakan on 13.07.2022.
//

import UIKit
import RxSwift
import RxCocoa

class LocationDetailViewController: UIViewController {
    
    var viewModel: LocationDetailViewModel
    
    var disposeBag : DisposeBag! = {
        return DisposeBag()
    }()
    
    private var locationName: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private var locationType: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private var locationDimension: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private var locationCreated: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 18.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    init(viewModel: LocationDetailViewModel){
        self.viewModel = viewModel
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

        view.addSubview(locationName)
        view.addSubview(locationType)
        view.addSubview(locationDimension)
        view.addSubview(locationCreated)
        
        listenObject()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        locationName.topToSuperview(offset: 16, usingSafeArea: true)
        locationName.leadingToSuperview(offset: 16)
        locationName.trailingToSuperview(offset: 16)
        locationName.height(36)
        
        locationType.topToBottom(of: locationName)
        locationType.leadingToSuperview(offset: 16)
        locationType.trailingToSuperview(offset: 16)
        locationType.height(36)
        
        locationDimension.topToBottom(of: locationType)
        locationDimension.leadingToSuperview(offset: 16)
        locationDimension.trailingToSuperview(offset: 16)
        locationDimension.height(36)
        
        locationCreated.topToBottom(of: locationDimension)
        locationCreated.leadingToSuperview(offset: 16)
        locationCreated.trailingToSuperview(offset: 16)
        locationCreated.height(36)
    }
    
    func setUpView(locationDetail: LocationDetail){
        
        guard let name = locationDetail.name, let type = locationDetail.type, let dimension = locationDetail.dimension, let created = locationDetail.created else { return }
        
        locationName.text = "Name of place: \(name)"
        locationType.text = "Type: \(type)"
        locationDimension.text = "Dimension: \(dimension)"
        locationCreated.text = "Created: \(created)"
        
    }
    
    func listenObject(){
        
        viewModel.locationDetail.asObservable()
            .subscribe { [weak self] locationDetail in
                self?.setUpView(locationDetail: locationDetail)
            } onError: { error in
                print(error)
            } onCompleted: {
                print("completed")
            } onDisposed: {
                print("disposed")
            }.disposed(by: disposeBag)
    }
}
