//
//  ViewController.swift
//  PagingCollectionViewLayout
//
//  Created by Vladislav Mashkov on 15.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // Properties
    var numberOfItemsInCollectionView:   Int        = 10
    
    var colorsOfItemsInCollectionView:   [UIColor]  = [.systemYellow, .systemBlue, .systemGreen, .systemRed, .systemBrown]
    
    // MARK: - UI Elements
    lazy var headerLabel:           UILabel           =  {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.text = "Horizontal scroll"
        label.textColor = .white
        
        return label
    }()
    
    lazy var headCollectionView:    UICollectionView  =  {
        
        let layout = PagingCollectionViewLayout()
        
        let currentItemWidth: CGFloat = UIScreen.main.bounds.width - 150
        
        let currentSpacing = (UIScreen.main.bounds.width - currentItemWidth) / 2
        
        layout.minimumLineSpacing = currentSpacing
        
        layout.itemSize = CGSize(width: currentItemWidth,
                                 height: 90)
        
        layout.sectionInset = .init(top: 2, left: currentSpacing, bottom: 2, right: currentSpacing)
        
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .clear
        view.decelerationRate = .fast
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.delegate = self
        view.dataSource = self
        
        view.tag = 1
        
        return view
    }()
    
    lazy var middleCollectionView:  UICollectionView  =  {
        
        let layout = PagingCollectionViewLayout()
        
        let currentItemWidth: CGFloat = UIScreen.main.bounds.width / 3.5
        
        let currentSpacing = (UIScreen.main.bounds.width - currentItemWidth) / 2
        
        layout.itemSize = CGSize(width: currentItemWidth,
                                 height: 90)
        
        layout.sectionInset = .init(top: 2, left: currentSpacing, bottom: 2, right: currentSpacing)
        
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .clear
        view.decelerationRate = .fast
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.delegate = self
        view.dataSource = self
        
        view.tag = 3
        
        return view
    }()
    
    lazy var bottomCollectionView:  UICollectionView  =  {
        
        let layout = PagingCollectionViewLayout()
        
        let currentItemWidth: CGFloat = UIScreen.main.bounds.width - 50
        
        layout.itemSize = CGSize(width: currentItemWidth,
                                 height: 90)
        
        layout.sectionInset = .init(top: 2, left: 10, bottom: 2, right: 10)
        
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .clear
        view.decelerationRate = .fast
        
        view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        view.delegate = self
        view.dataSource = self
        
        view.tag = 2
        
        return view
    }()
    
    // MARK: - Configuration methods
    private func setupConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        
        constraints.append(headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constraints.append(headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30))
        
        constraints.append(middleCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(middleCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(middleCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor))
        constraints.append(middleCollectionView.heightAnchor.constraint(equalToConstant: 100))
        
        constraints.append(headCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(headCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(headCollectionView.bottomAnchor.constraint(equalTo: middleCollectionView.topAnchor, constant: -10))
        constraints.append(headCollectionView.heightAnchor.constraint(equalToConstant: 100))
        
        constraints.append(bottomCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(bottomCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(bottomCollectionView.topAnchor.constraint(equalTo: middleCollectionView.bottomAnchor, constant: 10))
        constraints.append(bottomCollectionView.heightAnchor.constraint(equalToConstant: 100))
        
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    // MARK: - ViewController life cycle
    override func loadView() {
        super.loadView()
        
        view.addSubview(headerLabel)
        view.addSubview(headCollectionView)
        view.addSubview(middleCollectionView)
        view.addSubview(bottomCollectionView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
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
        cell.layer.borderWidth = 2
        
        return cell
        
    }
    
    
    
}

