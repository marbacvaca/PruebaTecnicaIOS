//
//  LoaderView.swift
//  PruebaTecnica
//
//  Created by CSA MEX  on 15/09/22.
//

import UIKit

class LoaderView: NSObject {

  private var container: UIView
  private var indicator: UIActivityIndicatorView
  private var label: UILabel
    
  override init() {
      container = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
      container.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
      indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
      label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
  }

  func addFullScreenActivityIndicator(view: UIView) {
      container.frame.size = view.frame.size
      container.isHidden = false
      indicator.center = container.center
      indicator.style = .medium
      indicator.color = .white
      label.center = CGPoint(x: indicator.frame.origin.x + indicator.frame.size.width/2,
                             y: indicator.frame.origin.y - indicator.frame.size.height/2)
      label.textAlignment = .center
      label.text = "Loading..."
      label.font = UIFont.boldSystemFont(ofSize: 20.0)
      label.textColor = .white
      container.addSubview(label)
      container.addSubview(indicator)
      view.addSubview(container)
      startAnimating()
  }

  func removeFullScreenActivityIndicator() {
      container.isHidden = true
      stopAnimating()
      container.removeFromSuperview()
  }

  func startAnimating() {
      indicator.isHidden = false
      indicator.startAnimating()
  }

  func stopAnimating() {
      indicator.stopAnimating()
  }
}
