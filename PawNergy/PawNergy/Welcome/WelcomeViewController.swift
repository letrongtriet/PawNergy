//
//  WelcomeViewController.swift
//  PawNergy
//
//  Created by Trong Triet Le on 20/02/2019.
//  Copyright © 2019 Triet Le. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, Storyboarded {
    
    var welcomeCoordinator: WelcomeCoordinator?
    
    fileprivate var numberOfPages = 4
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 0,
                                                 left: 0,
                                                 bottom: 0,
                                                 right: 0)
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionViewLayout.minimumLineSpacing = 0
        
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = numberOfPages
    }
}

extension WelcomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfPages
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.random
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let horizontalCenter = width / 2
        
        pageControl.currentPage = Int(offSet + horizontalCenter) / Int(width)
    }
}
