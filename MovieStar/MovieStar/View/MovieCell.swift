//
//  MovieCell.swift
//  MovieStar
//
//  Created by Viral on 04/02/22.
//  Copyright © 2022 View The Space. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var favoriteImg: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeholderImg: UIImageView!

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
}

extension UITableViewCell {
    static var resuableIdentifier: String {
        return "\(Self.self)"
    }
}
