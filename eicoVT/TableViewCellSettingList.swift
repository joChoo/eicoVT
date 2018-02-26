//
//  TableViewCellSettingList.swift
//  eicoVT
//
//  Created by Jonathan Guedon on 16/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit

class TableViewCellSettingList: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var buttonAdd: UIButton!
    @IBAction func buttonAddPressed(_ sender: Any) {


        
    }

        
        
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonAll: UIButton!
    @IBAction func buttonAllPressed(_ sender: Any) {
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    var list:[ECLocalizer] = [
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer(),
        ECLocalizer()
    
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let nibList = UINib(nibName: "CollectionViewCellSettingList", bundle: Bundle.main)

        collectionView.register(nibList, forCellWithReuseIdentifier: "collectionCell")
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: 123, height: 115)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CollectionViewCellSettingList = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCellSettingList
        return cell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func presentContextualList(){
    
    }
    
}
