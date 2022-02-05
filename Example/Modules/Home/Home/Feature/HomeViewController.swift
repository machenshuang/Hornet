//
//  HomeViewController.swift
//  Home
//
//  Created by 马陈爽 on 2022/2/4.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView()
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.image = HomeBundle.imageNamed(name: "3.jpeg")
        // Do any additional setup after loading the view.
    }

}
