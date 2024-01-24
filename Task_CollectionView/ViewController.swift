//
//  ViewController.swift
//  Task_CollectionView
//
//  Created by Akash Belekar on 24/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView:UICollectionView!
    
    let clothesImgArray:[String] = ["dress1.jpg","dress2.jpg","dress3.png","dress4.jpg","dress5.jpg","dress6.png","pant1.png","pant2.png","pant3.png","pant4.jpg","pant5.jpg","pant6.jpg"]
    let clothesNameArry:[String] = ["Levi`s t-shirt","adidas t-shirt","zara shirt","Allen Soly shirt","supreme shirt","MCY JOY shirt","Levi`s Men`s","Supreme Men`s","adidas Men`s","zara Men`s","Allen Sloy Men`s","Fashion Frenszy Men`s"]
    let clothesPriceArray:[String] = ["40$","35$","54$","30$","25$","45$","15$","25$","35$","50$","30$","45$"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Regiter Nib
        collectionView.register(UINib(nibName: "ClothsCVC", bundle: nil), forCellWithReuseIdentifier: "ClothsCVC")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clothesImgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClothsCVC", for: indexPath) as! ClothsCVC
        cell.imgClothes.image = UIImage(named: "\(clothesImgArray[indexPath.row])")
        cell.lblClothesName.text = clothesNameArry[indexPath.row]
        cell.lblClothesPrice.text = ("price: \(clothesPriceArray[indexPath.row])")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/3.5
        let height = collectionView.frame.height/4
        return CGSize(width: width, height:height)
    }
}
