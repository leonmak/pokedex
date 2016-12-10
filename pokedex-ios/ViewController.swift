//
//  ViewController.swift
//  pokedex-ios
//
//  Created by Leon on 10/12/16.
//  Copyright © 2016 Leon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collection.dataSource = self
        collection.delegate = self
        
        parsePokemonCSV()
    }

    func parsePokemonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")
        do {
            let csv = try CSV(contentsOfURL: path!)
            let rows = csv.rows
            
            for row in rows {
                let name = row["identifier"]!
                let pokemonId = Int(row["id"]!)!
                let pokemon = Pokemon(name: name, pokemonId: pokemonId)
                self.pokemon.append(pokemon)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            let pokemon = self.pokemon[indexPath.row]
            cell.configureCell(pokemon)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemon.count
   }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Auto-complete: Sizeforitem
    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSize(width: 100, height: 100)

    }


}

