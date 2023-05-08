//
//  Settings.swift
//  fullPomodoroUIKit
//
//  Created by Тулеби Берик on 07.05.2023.
//

import UIKit

class SettingsView: UIViewController {

    private let bgImage: UIImageView = {
        let image = UIImage(named: "work")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [bgImage].forEach{self.view.addSubview( $0 )}
        
        bgImage.fillView(self.view)
        
    }


}
