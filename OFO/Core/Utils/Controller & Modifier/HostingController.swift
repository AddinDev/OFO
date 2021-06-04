//
//  HostingController.swift
//  OFO
//
//  Created by addin on 04/06/21.
//

import SwiftUI

class HostingController<ContentView>: UIHostingController<ContentView> where ContentView : View {
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
}
