import UIKit

class CircularTimerView: UIView {
    
    private let circleLayer = CAShapeLayer()
    private let circleLayer2 = CAShapeLayer()
    private let timerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        // Configure circle layer
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: (min(bounds.width, bounds.height) - 248) / 2,
            startAngle: -.pi / 2,
            endAngle: .pi * 2 - .pi / 2,
            clockwise: true
        )
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.white.cgColor
        circleLayer.lineWidth = 6
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeEnd = 1.0
        layer.addSublayer(circleLayer)
        
        
        circleLayer2.path = circlePath.cgPath
        circleLayer2.strokeColor = UIColor.white.withAlphaComponent(0.5).cgColor
        circleLayer2.lineWidth = 6
        circleLayer2.fillColor = UIColor.clear.cgColor
        circleLayer2.strokeEnd = 1.0
        layer.addSublayer(circleLayer2)
        
        // Configure timer label
        let labelSize: CGFloat = 200 // Adjust the size of the label
            let labelOrigin = CGPoint(x: bounds.midX - labelSize / 2, y: bounds.midY - labelSize / 2)
            timerLabel.frame = CGRect(origin: labelOrigin, size: CGSize(width: labelSize, height: labelSize))
            timerLabel.textAlignment = .center
        timerLabel.font = UIFont.systemFont(ofSize: 44, weight: .bold)
        timerLabel.textColor = .white
            addSubview(timerLabel)
    }
    
    func setProgress(_ progress: CGFloat) {
        circleLayer.strokeEnd = progress
    }
    
    func setTimerText(_ text: String) {
        timerLabel.text = text
    }
}
