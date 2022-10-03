//
//  RestaurantTableViewCell.swift
//  youtellwecare_YTWC
//
//  Created by noshair on 12/01/2020.
//  Copyright © 2020 ucp. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantTableViewCell: UITableViewCell {
     
    @IBOutlet weak var restaurantImageView: UIImageView!
      @IBOutlet weak var makerImageView: UIImageView!
      @IBOutlet weak var restaurantNameLabel: UILabel!
      @IBOutlet weak var locationLabel: UILabel!
     

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func configure(with viewModel: RestaurantListViewModel) {
        restaurantImageView.af_setImage(withURL: viewModel.imageUrl)
        restaurantNameLabel.text = viewModel.name
        locationLabel.text = viewModel.distance
    }
}
