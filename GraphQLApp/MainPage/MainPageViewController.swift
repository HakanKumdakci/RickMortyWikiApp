//
//  MainPageViewController.swift
//  GraphQLApp
//
//  Created by Hakan on 9.07.2022.
//

import UIKit
import AppStarterKit
import TinyConstraints

class MainPageViewController: UIViewController {
    
    private var stackView = UIStackView()
    
    lazy private var episodesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 9
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Show Episodes", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 24.0)
        button.tintColor = .black
        if #available(iOS 15.0, *) {
            var conf = UIButton.Configuration.borderless()
            conf.titlePadding = 12
            button.configuration = conf
        } else {
            button.contentEdgeInsets = .init(top: 0, left: 16, bottom: 0, right: 16)
        }
        button.addTarget(self, action: #selector(showEpisodes), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
        prepareStackView()
        // Do any additional setup after loading the view.
    }
    
    private func prepareStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 16
        
        stackView.addArrangedSubview(episodesButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        stackView.topToSuperview(offset: 16, usingSafeArea: true)
        stackView.leadingToSuperview(offset: 16)
        stackView.trailingToSuperview(offset: 16)
    }
    
    
    @objc private func showEpisodes(){
        let vc = EpisodeViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
