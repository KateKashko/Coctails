//
//  ViewController.swift
//  Coctails
//
//  Created by Kate Kashko on 13.03.2024.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    
    // MARK: - Variables
    private var images: [UIImage] = []
    
    // MARK: - UI Components
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CocktailCell.self, forCellWithReuseIdentifier: CocktailCell.reuseIdentifier)
        return collectionView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        setupConstraints()
        
        for _ in 0...10 {
            images.append(UIImage(named: "Mojito")!)
            images.append(UIImage(named: "Margarita")!)
            images.append(UIImage(named: "Cosmopolitan")!)
            images.append(UIImage(named: "BloodyMary")!)
        }
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setupUI() {
        self.view.addSubview(collectionView)
    }
}

extension MainViewController {
    
    private func setupConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailCell.reuseIdentifier, for: indexPath) as? CocktailCell else {
            fatalError("its not working")
        }
        
        let image = self.images[indexPath.row]
        cell.configure(with: image)
            return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.view.frame.width/2) - 2
        return CGSize(width: size, height: 235)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
}
