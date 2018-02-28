//
//  ViewControllerMain2.swift
//  eicoVT
//
//  Created by ingouackaz on 28/02/2018.
//  Copyright © 2018 Jonathan Guedon. All rights reserved.
//

import UIKit
import Parse
import Bolts


enum XLocalizerItem : Int {
    case Nothing = 1
    case Nexus = 2
    case Patients = 3
    case Patients0 = 4
    case Teams = 5
    case Parts = 6
    case SubParts = 7
}

enum XLocalizer {
    case niveauA
    case niveauB
    case niveauC
    case niveauCTemplate
    
    var typeNameAndDescription: (module1: XLocalizerItem, module2: XLocalizerItem,  module3: XLocalizerItem) {
        switch self {
        case .niveauA:
            return (XLocalizerItem.Patients0, XLocalizerItem.Teams,  XLocalizerItem.Nothing)
        case .niveauB:
            return (XLocalizerItem.Patients, XLocalizerItem.Teams,  XLocalizerItem.Nexus)
        case .niveauC:
            return (XLocalizerItem.Patients, XLocalizerItem.Teams,  XLocalizerItem.Nothing)
        case .niveauCTemplate:
            return (XLocalizerItem.Parts, XLocalizerItem.Patients0,  XLocalizerItem.Nexus)
        }
    }
}

class ViewControllerMain2: UIViewController {
    
    @IBOutlet weak var collectionGalaxy: UICollectionView!
    @IBOutlet weak var tableViewComment: UITableView!

    
    var currentMode : XLocalizer = XLocalizer.niveauA
    var listeObject1 : [PFObject] = []
    var listeObject2 : [PFObject] = []
    var comments : [PFComment] = []

    // Niveau A
    // Patients0 && Teams && Nexus
    
    // Niveau B
    // Patients && Teams && Nexus
    
    // Niveau C
    // Teams && Parts && Nexus ( && famille )
    
    // Niveau C Template
    //  Parts& & Patients0 && Nexus

    enum names {
        case Swift
        case Closures
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initData()
        initUI()
        updateData()
    }
    

    
    func initData(){
        self.collectionGalaxy.delegate = self
        self.tableViewComment.delegate = self
    }
    
    func initUI(){
        
    }
    
    func updateData(){
        
        // on effectue une request pour récupérer les infos du localizer courant
        
        LocalizerManager.getLocalizerItemsFor(niveau: currentMode, completion: { (succeed, xlisteObject1, xlisteObjects2, comments) in
            
            self.listeObject1 = xlisteObject1!
            self.listeObject2 = xlisteObjects2!
            
            self.collectionGalaxy.reloadData()
        })
        // Mettre à jour le fond d'ecran en fonction du currentMode
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension ViewControllerMain2 : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ViewControllerMain2 : UICollectionViewDataSource, UICollectionViewDelegate{

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch (currentMode, section) {
        // On clique sur Patient0
        case (.niveauA, 0):
            print("")
            return self.listeObject1.count
        case (.niveauA, 1):
            print("")
            return self.listeObject2.count
        case (.niveauA, 2):
            print("")
            return 0
        case (.niveauCTemplate, 0):
            return self.listeObject1.count
        case (.niveauCTemplate, 1):
            return self.listeObject2.count
        default:
            return 0
        }
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch (currentMode, indexPath.section) {
        // On clique sur Patient0
        case (.niveauA, 0):
            print("")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellGalaxyExample.identifier,
                                                          for: indexPath) as! CollectionViewCellGalaxyExample
            
            return cell
        // On clique sur Teams
        case (.niveauA, 1):
            print("")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellGalaxyExample.identifier,
                                                          for: indexPath) as! CollectionViewCellGalaxyExample
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch (currentMode, indexPath.section) {
            // On clique sur Patient0
        case (.niveauA, 0):
            print("")
            currentMode = .niveauCTemplate
            // On clique sur Teams
            self.updateData()
        case (.niveauA, 1):
            currentMode = .niveauB
        default:
            print("")
        }

    }
    
}
