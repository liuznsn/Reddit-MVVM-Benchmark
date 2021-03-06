//
//  LinkImageCell.swift
//  Reddit
//
//  Created by Ivan Bruel on 06/06/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import UIKit
import Kingfisher

class LinkImageCell: LinkCell {

  @IBOutlet weak var linkImageView: LinkImageView! {
    didSet {
      linkView = linkImageView
    }
  }

  var linkImageViewModel: LinkListImageViewModel! {
    didSet {
      linkViewModel = linkImageViewModel

      if let imageURL = linkImageViewModel.imageURL {
        linkImageView.imageView
          .kf_setImageWithURL(imageURL, optionsInfo: [.Transition(.Fade(0.25))]) {
            [weak self] (image, _, _, _) in
            guard let image = image else { return }
            self?.linkImageViewModel.imageSize.value = image.size
        }
      } else {
        linkImageView.imageView.image = nil
      }

      if let overlay = linkImageViewModel.overlay {
        linkImageView.overlayLabel.text = overlay
        linkImageView.showOverlay()
      } else {
        linkImageView.hideOverlay()
      }

      if let indicator = linkImageViewModel.indicator {
        linkImageView.indicatorLabel.text = indicator
        linkImageView.indicatorLabel.hidden = false
      } else {
        linkImageView.indicatorLabel.hidden = true
      }
    }
  }
}
