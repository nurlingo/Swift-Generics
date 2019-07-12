//
//  DogController.swift
//  GenericsTable
//
//  Created by Daniya on 12/07/2019.
//  Copyright © 2019 nurios. All rights reserved.
//

import UIKit

struct Greeting: Decodable {
    let phrase: String
}

class GreetingCell: BaseCell<Greeting> {
    
    override var item: Greeting! {
        didSet {
            titleLabel.text = item.phrase
        }
    }
}

class GreetingCollectionController: BaseCollectionViewController<GreetingCell, Greeting> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchGenericData(urlString: "https://api.myjson.com/bins/iwscn") { (greetings: [Greeting]) in
            self.items = greetings
        }
        
    }
    
}
