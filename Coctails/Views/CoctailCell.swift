//
//  CoctailCell.swift
//  Coctails
//
//  Created by Kate Kashko on 13.03.2024.
//

import UIKit
import SnapKit

class CocktailCell: UICollectionViewCell {
    
  static let reuseIdentifier = "CocktailCell"
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.backgroundColor = UIColor(named: "lightPink")
        element.axis = .vertical
        element.spacing = 25
        element.contentMode = .center
        element.alignment = .center
        element.layer.cornerRadius = 20
//        element.layer.shadowColor = UIColor.black.cgColor
//        element.layer.shadowOffset = CGSize(width: 0, height: 0)
//        element.layer.shadowOpacity = 0.1
//        element.layer.shadowRadius = 30
        
        return element
    }()
    
    private lazy var cocktailName: UILabel = {
        let element = UILabel()
        element.text = "Margarita"
        element.font = .systemFont(ofSize: 20)
        element.textAlignment = .center
        return element
    }()
    
    private lazy var cocktailImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "Margarita1")
        return element
    }()
    
    // MARK: - Init
    
    public func configure(with image: UIImage) {
        self.cocktailImage.image = image
        self.setupUI()
    }
    
    private func setupUI() {
        setViews()
        setupConstraints()
    }
    
    private func setViews() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(cocktailName)
        mainStackView.addArrangedSubview(cocktailImage)

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cocktailImage.image = nil
    }
}

extension CocktailCell {
    private func setupConstraints() {
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
            make.height.equalTo(235)
        }
        
        cocktailName.snp.makeConstraints { make in
            make.centerX.equalTo(mainStackView)
            make.top.equalTo(mainStackView).inset(15)
        }
        
        cocktailImage.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.centerX.equalTo(mainStackView)
            make.bottom.equalTo(mainStackView).inset(10)
        }
        
        
    }
}
