//
//  MovieCell.swift
//  MovieStar
//
//  Created by Viral on 04/02/22.
//  Copyright © 2022 View The Space. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell {

    @IBOutlet weak var favoriteImg: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeholderImg: UIImageView!

    var isFavorite: Bool = false {
        didSet {
            favoriteImg.image = isFavorite ? UIImage(named: "star_filled") : UIImage(named: "star_outline")
        }
    }

    static let nibName = "MovieCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    static var nib: UINib {
        return UINib(nibName: nibName, bundle: nil)
    }

    func configure(_ model: MovieItemViewModel) {
        titleLabel.text = model.title
        subTitleLabel.text = model.subTitle
        placeholderImg.af.setImage(withURL: model.imageUrl)
        isFavorite = model.favorite
    }
}

extension UITableViewCell {
    static var resuableIdentifier: String {
        return "\(Self.self)"
    }
}
