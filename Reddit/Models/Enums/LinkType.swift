//
//  LinkType.swift
//  Reddit
//
//  Created by Ivan Bruel on 18/05/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import Foundation

enum LinkType: Equatable {

  case Video
  case Image
  case Album
  case SelfPost
  case LinkPost
}

extension LinkType {

  static func typeFromLink(link: Link) -> LinkType {
    if link.selfPost == true {
      return .SelfPost
    } else if link.isVideoLink {
      return .Video
    } else if link.isAlbumLink {
      return .Album
    } else if link.isImageLink {
      return .Image
    } else {
      return .LinkPost
    }
  }
}

func == (lhs: LinkType, rhs: LinkType) -> Bool {
  switch (lhs, rhs) {
  case (.Video, .Video):
    return true
  case (.Image, .Image):
    return true
  case (.Album, .Album):
    return true
  case (.SelfPost, .SelfPost):
    return true
  case (.LinkPost, .LinkPost):
    return true
  default:
    return false
  }
}
