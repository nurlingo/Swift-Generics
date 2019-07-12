//
//  BaseCell.swift
//  GenericsTable
//
//  Created by Daniya on 12/07/2019.
//  Copyright © 2019 nurios. All rights reserved.
//

import UIKit

class BaseCell<U>: UICollectionViewCell {
    var item: U!
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = UIColor.darkText
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews(){
        addSubview(titleLabel)
        addSubview(bottomSeparatorView)
        
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        bottomSeparatorView.topAnchor.constraint(equalTo: bottomAnchor, constant: 4).isActive = true
        bottomSeparatorView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        bottomSeparatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
