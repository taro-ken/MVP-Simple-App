//
//  Storyboard+.swift
//  MVP-Simple-App
//
//  Created by 木元健太郎 on 2021/09/26.
//


import UIKit

// Storyboardの読み込みを１箇所にまとめる
extension UIStoryboard {
  static var ViewController: ViewController {
    UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController
  }

  static var secondViewController: SecondViewController {
    UIStoryboard.init(name: "Second", bundle: nil).instantiateInitialViewController() as! SecondViewController
  }

}
