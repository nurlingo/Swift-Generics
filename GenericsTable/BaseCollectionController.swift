//
//  ViewController.swift
//  GenericsTable
//
//  Created by Nursultan on 27/04/2019.
//  Copyright © 2019 nurios. All rights reserved.
//

import UIKit

class BaseCollectionViewController<C: BaseCell<U>, U>: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    fileprivate let cellId = "cellId"
    
    var items = [U]() {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(C.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseCell<U>
        cell.item = items[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 50)
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (T) -> ()) {
        
        guard let url = URL(string: urlString) else {
            print("not able to convert string to url: \(urlString)")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            if let error = error {
                print("failed to fetch data for url: \(url),\nfailed with error:", error)
                return
            }
            
            guard let data = data else {
                print("data is nil for url: \(url)")
                return
            }
            
            do {
                
                let decodedJson = try JSONDecoder().decode(T.self, from: data)
                completion(decodedJson)
                
            } catch let jsonErr {
                print("Failed to decode json:", jsonErr)
            }
            
        }.resume()
    }
    
}
