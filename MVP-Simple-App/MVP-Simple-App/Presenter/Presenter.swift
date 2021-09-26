//
//  presenter.swift
//  MVP-Simple-App
//
//  Created by 木元健太郎 on 2021/09/26.
//

import Foundation

//ViewController側からPresenterに「情報くれ」と通知することになるので、Inputの処理
protocol PresenterInput {
    var numberOfItems: Int {get}
    func item(index:Int)->SampleItem
    func didSelect(index: Int)
   
    
}

protocol PresenterOutput :AnyObject{
    func update(text: String)
    
}


final class Presenter {
    private var output:PresenterOutput?
    //データをここで持つ
    private var items:[SampleItem] = SampleItem.createItems()
    
    init(output:PresenterOutput) {
        self.output = output
    }
    
}
//Inputプロトコルに準拠して、入力処理を行う
//vcからのInputを受け付ける
extension Presenter:PresenterInput{

    //itemsとしてModelデータを保持しているので、外部からModelを受け取れる。
    var numberOfItems: Int {
        items.count
    }
    
    func item(index: Int) -> SampleItem {
        items[index]
    }
    
    func didSelect(index: Int) {
        output?.update(text: items[index].title)
    }
    
}
