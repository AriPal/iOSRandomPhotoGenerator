//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Dlér Hasan on 18/02/2023.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView();
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white;
        return imageView;
    }()
    
    private let button: UIButton = {
        let button = UIButton();
        button.setTitle("Change image", for: .normal);
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white;
        return button;
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.height-50-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue;
        view.addSubview(imageView);
        imageView.frame = CGRect(x: 0, y: 0, width:  300, height:  300)
        imageView.center = view.center ;
        
        view.addSubview(button);
        
        getRandomPhoto();
        
        button.addTarget(self , action: #selector(triggetButton), for: .touchUpInside)
    }
    
    @objc func triggetButton(){
        getRandomPhoto();
        view.backgroundColor = colors.randomElement()
    }
    
    let colors: [UIColor] = [.systemBrown,.systemCyan, .systemBlue, .systemMint, .systemGray, .systemTeal]

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/random/600x600";
        let url = URL(string: urlString)!
        guard let data =  try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data);
    }
}

