//
//  ViewController.swift
//  MVP-Simple-App
//
//  Created by 木元健太郎 on 2021/09/25.
//

import UIKit

class ViewController: UIViewController {
    //storyboardからVCを生成する
    static func makeFromStoryboard() -> ViewController {
            let vc = UIStoryboard.ViewController
            return vc
        }
    
    private var outputText: String = "なにも選択されていません"
    
    
    @IBOutlet weak var outputLabel: UILabel!{
        didSet{
            outputLabel.text = outputText
        }
        
    }
    
    //ここでPresenterとViewControllerを繋げる
    private var presenter: PresenterInput!
    func inject(presenter:PresenterInput){
        self.presenter = presenter
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
}
//Outputプロトコルに準拠し、Presenter出力処理を受け取る
extension ViewController:PresenterOutput{
    func update(text: String) {
        outputLabel.text = text
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //PresenterInputで受け取ったModelをここで使う
        presenter.numberOfItems
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //PresenterInputで受け取ったModelをindex番目Cellにいれる
        let item = presenter.item(index: indexPath.row)
        cell.textLabel?.text = item.title
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    // cellを選択したときの処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(index: indexPath.row)
    }
}
