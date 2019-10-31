//
//  PlanningViewController.swift
//  Potluck
//
//  Created by Daniel Morales on 10/22/19.
//  Copyright © 2019 Jessica Rios. All rights reserved.
//

import UIKit
import FirebaseDatabase

//https://www.youtube.com/watch?v=9sp_u18fPlM&list=PLrT2tZ9JRrf4FG0wKkZGUTFqkkS3TiHKv&index=6
//8:13

class PlanningViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    var event: Event!
    var items = [Item]()
    var ref: DatabaseReference!
    
    @IBOutlet weak var itemTextView: UILabel!
    @IBOutlet weak var personInChangeImg: UIImageView!
    @IBOutlet weak var personInChargeTextView: UILabel!
    @IBOutlet weak var itemsCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        itemsCollection.delegate = self
        itemsCollection.dataSource = self
        
        fetchPlanning();
    }
    
    func fetchPlanning(){
        
        self.ref.child(event.path).observeSingleEvent(of: .value) { (snapshot) in
            var item = snapshot.value as! [String: Any]
            
            self.itemTextView.text = item["name"] as? String
            item.removeValue(forKey: "name");
            
            self.ref.child("users").child(item["charge"] as! String).observeSingleEvent(of: .value, with: { (snapshot) in
                let user = snapshot.value as! [String: Any]
                self.personInChargeTextView.text = user["name"] as! String
            })
            item.removeValue(forKey: "charge");
            
            for (itemId, plan) in item  {
                
                self.ref.child(self.event.path).child(itemId).observeSingleEvent(of: .value) { (snapshot2) in
                    
                    
                    let details = snapshot2.value as! [String: Any]
                    
                    self.items.append(Item(id: "", name: details["name"] as! String, person: "fix", image: "none", details: "none", owner: "none", path: self.event.path + "/" + itemId))
                    
                    self.itemsCollection.reloadData();
                }
            }
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = itemsCollection.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
        
        cell.ItemName.text = self.items[indexPath.item].name;
        print(self.items[indexPath.item].person)
        cell.person.text = self.items[indexPath.item].person;
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
