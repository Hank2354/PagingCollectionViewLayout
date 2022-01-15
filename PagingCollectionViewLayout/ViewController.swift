//
//  ViewController.swift
//  PagingCollectionViewLayout
//
//  Created by Vladislav Mashkov on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var numberOfItemsInCollectionView: Int = 10
    
    var colorsOfItemsInCollectionView: [UIColor] = [.systemYellow, .blue, .green, .red, .brown]
    
    // MARK: - UI Elements
    lazy var mainCollectionView: UICollectionView = {
        
        let layout = PagingCollectionViewLayout()
        
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 50,
                                 height: UIScreen.main.bounds.height / 3)
        
        layout.sectionInset = .init(top: 2, left: 10, bottom: 2, right: 2)
        
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .clear
        view.decelerationRate = .fast
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    // MARK: - Configuration methods
    private func setupConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(mainCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(mainCollectionView.heightAnchor.constraint(equalToConstant: 120))
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    // MARK: - ViewController life cycle
    override func loadView() {
        super.loadView()
        
        view.addSubview(mainCollectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        setupConstraints()
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItemsInCollectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let currentColorIndex = Int.random(in: 0...4)
        
        let currentColor = colorsOfItemsInCollectionView[currentColorIndex]
        
        cell.backgroundColor = currentColor
        
        return cell
        
    }
    
    
    
}

