//
//  CatViewController.swift
//  ChallengeOne
//
//  Created by Anderson Ortiz Dias Junior on 05/04/22.
//

import UIKit
import SnapKit
class CatViewController: UIViewController, ViewCodable {
//MARK: - SnapKit
    func setupAnchors() {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        let screenWidth = screenSize.width
        guard let window = UIApplication.shared.keyWindow else {return}
        catImage.snp.makeConstraints { make in
            make.top.equalTo(window.safeAreaInsets.top).inset(100)
            make.leading.equalToSuperview()
            make.leftMargin.equalTo(20)
            make.rightMargin.equalTo(20)
            make.trailing.equalToSuperview()
            make.height.equalTo(screenHeight/2.3)
            make.width.equalTo(screenWidth)
        }
        temperamentLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(catImage.snp_bottom).inset(-20)
            make.height.equalTo(40)
        }
        lifeSpanLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.left.equalToSuperview().inset(20)
            make.centerX.equalToSuperview().inset(20)
            make.top.equalTo(temperamentLabel.snp.bottom).inset(-15)
        }
        descriptLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
            make.centerX.equalToSuperview().inset(40)
            make.top.equalTo(lifeSpanLabel.snp.bottom).inset(-15)
        }
    }
    func setupViews()
    {
        self.view.addSubview(descriptLabel)
        self.view.addSubview(catImage)
        self.view.addSubview(temperamentLabel)
        self.view.addSubview(lifeSpanLabel)
        
    }
//MARK: - Variables
    var breed: Breed?
    lazy var catImage : UIImageView = {
        let catImage = UIImageView()
        if let urlString = breed?.image.url
        {
            guard let url = URL(string: urlString) else{return catImage}
        if let data = try? Data(contentsOf: url) {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                catImage.image = image
                            }
                        }
        }}
        return catImage
    }()
    lazy var lifeSpanLabel: UILabel={
        let label = UILabel()
        //label.backgroundColor = .blue
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.numberOfLines = 0
        if let breedLife = breed?.lifeSpan
        { label.text = "Life Span: " + breedLife + " Years"}
        else {label.text = "life_span"}
        label.textAlignment = .left
        label.textColor = .systemRed
        return label
    }()
    lazy var temperamentLabel: UILabel={
        let label = UILabel()
        //label.backgroundColor = .blue
        label.font = UIFont.italicSystemFont(ofSize: 14)
        label.numberOfLines = 0
        if let breedTemp = breed?.temperament
        { label.text = "Temperament: " + breedTemp }
        else {label.text = "temperament"}
        label.textAlignment = .left
        label.textColor = .systemBlue
        return label
    }()
    lazy var descriptLabel: UILabel={
        let label = UILabel()
        //label.backgroundColor = .blue
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 16)
        label.numberOfLines = 0
        if let breedDesc = breed?.catDescription
        { label.text = breedDesc }
        else {label.text = "description"}
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
//MARK: - Init Methods
    public init(_ breed : Breed) {
        self.breed = breed
        super.init(nibName: nil, bundle: nil)
        setupViews()
        setupAnchors()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
//MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let breedName = breed?.name
        {
            navigationItem.title = breedName
        }
        else{navigationItem.title = "Breed Info"}
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
}
//MARK: -SwiftUI Preview
#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        let img = BreedImageDTO(height: 400, id: "String", url: "https://pbs.twimg.com/media/EWjK7t3WkAIchYp.jpg", width: 400)
        let breed = Breed(id: "Gatito", name: "Gato", temperament: "Bota, na cabeça, que estilo, não é marra", lifeSpan: "String", description: "hasiudhadhasidhsaidhasidhsaidhiasd", image: img)
        let viewController = CatViewController(breed)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.backgroundColor = .green
        let tabBarController = UITabBarController()
        let toolBarItem = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        tabBarController.tabBar.backgroundColor = UIColor.green
        tabBarController.setToolbarItems([toolBarItem], animated: true)
        tabBarController.viewControllers = [navigationController]
        let pro13 = tabBarController
        
        return Group {
            pro13.preview.previewDevice(PreviewDevice(rawValue: "Iphone 13 Pro Max")).previewDisplayName("iPhone 13 Pro Max")
            
        }
    }
}
#endif
