//
//  EpisodeCollectionViewCell.swift
//  GraphQLApp
//
//  Created by Hakan on 14.07.2022.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "EpisodeCollectionViewCell"
    private var model: Episode!
    
    private var episodeName: UILabel = {
        var label = UILabel()
        label.font = UIFont(name: "Avenir-Medium", size: 13.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.layer.cornerRadius = 18
        
        contentView.addSubview(episodeName)
        
        contentView.layer.cornerRadius = 9
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        episodeName.topToSuperview()
        episodeName.leadingToSuperview(offset: 8)
        episodeName.trailingToSuperview(offset: 8)
        episodeName.bottomToSuperview()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        episodeName.text = nil
    }
    
    
    public func configure(model: Episode){
        self.model = model
        
        episodeName.text = model.name ?? ""
    }
    
}
