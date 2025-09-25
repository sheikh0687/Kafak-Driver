//
//  CustomLoader.swift
//  Kafek
//
//  Created by Techimmense Software Solutions on 19/02/25.
//

import Foundation

class CustomLoader {
    static var rotatingImageView: UIImageView?

    static func showCustomLoader() {
        // Prevent adding multiple loaders
        if rotatingImageView != nil { return }

        guard let window = UIApplication.shared.windows.first else { return }

        let loaderSize: CGFloat = 60  // Adjust size as needed
        let imageView = UIImageView(image: UIImage(named: "Loader"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: loaderSize, height: loaderSize)
        imageView.center = window.center  // Center in the window

        window.addSubview(imageView)
        rotatingImageView = imageView

        startRotatingAnimation()
    }

    static func startRotatingAnimation() {
        guard let rotatingImageView = rotatingImageView else { return }

        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.toValue = CGFloat.pi * 2  // Full circle rotation
        rotationAnimation.duration = 1.5  // Rotation speed
        rotationAnimation.repeatCount = Float.infinity  // Keep spinning
        rotationAnimation.isRemovedOnCompletion = false

        rotatingImageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }

    static func hideCustomLoader() {
        rotatingImageView?.layer.removeAnimation(forKey: "rotationAnimation")
        rotatingImageView?.removeFromSuperview()
        rotatingImageView = nil
    }
}
