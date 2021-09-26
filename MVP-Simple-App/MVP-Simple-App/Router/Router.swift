//
//  Router.swift
//  MVP-Simple-App
//
//  Created by 木元健太郎 on 2021/09/25.
//

import UIKit

final class Router {
    static func showRoot(window: UIWindow?) {
        let vc = ViewController.makeFromStoryboard()
        
        //ViewControllerで用意したinjectメソッドをここで呼び出す。
        let presenter = Presenter(output: vc)
        vc.inject(presenter: presenter)
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
    
    
    static func showSecond(fromVC: UIViewController) {
        let secondVC = SecondViewController.makeFromStoryboard()
            show(fromVC: fromVC, nextVC: secondVC)
        }
    
    private static func show(fromVC: UIViewController, nextVC: UIViewController) {
            if let nav = fromVC.navigationController {
                nav.pushViewController(nextVC, animated: true)
            } else {
                fromVC.present(nextVC, animated: true, completion: nil)
            }
}

}
