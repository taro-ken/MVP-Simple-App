//
//  SecondViewController.swift
//  MVP-Simple-App
//
//  Created by 木元健太郎 on 2021/09/25.
//

import UIKit

class SecondViewController:UIViewController {
    
    static func makeFromStoryboard() -> SecondViewController {
            let vc = UIStoryboard.secondViewController
            return vc
        }

    //ここでPresenterとViewControllerを繋げる
    private var presenter: PresenterInput!
    func inject(presenter:PresenterInput){
        self.presenter = presenter
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBOutlet weak var label: UILabel!
    
}

extension SecondViewController:PresenterOutput{
    func update(text: String) {
        label.text = text
    }
    
    
}
