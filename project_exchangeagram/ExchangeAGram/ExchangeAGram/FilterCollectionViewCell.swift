//
//  FilterCollectionViewCell.swift
//  ExchangeAGram
//
//  Created by Dave Stanton on 3/14/15.
//  Copyright (c) 2015 Dave Stanton. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        contentView.addSubview(imageView)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
