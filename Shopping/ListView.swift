//
//  ListView.swift
//  Shopping
//
//  Created by Sugabelly on 10/29/18.
//  Copyright © 2018 Lotanna Igwe-Odunze. All rights reserved.
//

import Foundation
import UIKit

class ShoppingListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // restructured CollectionViewController
    
    let mynotifier = Notifier()
    let itemControllerReference = ShoppingManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView?.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemControllerReference.groceryList.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let shoppingItem = itemControllerReference.groceryList[indexPath.item]
        
        itemControllerReference.updateGroceries(singleItem: shoppingItem)
        collectionView.reloadData()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shoppingCell", for: indexPath) as! shopCell
        
        let shoppingItem = itemControllerReference.groceryList[indexPath.item]
        cell.groceryItem = shoppingItem
        
        return cell
    }
    
    
    //Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notifySegue" {
            guard let nextViewController = segue.destination as? GetNotifiedController else {return}
            
            nextViewController.myItemController = itemControllerReference
            nextViewController.mynotifier = mynotifier
        }
    }
}

