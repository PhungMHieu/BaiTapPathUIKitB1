
import UIKit
class GaugeView: UIView {
    private let shapeLayer = CAShapeLayer()
    var progress: CGFloat = 0.0 {
        didSet {
            shapeLayer.strokeEnd = progress
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    override func draw(_ rect: CGRect) {
        setUpLayerBelow()
        setUpLayer()
    }
    private func setUpLayerBelow(){
        let center = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let arcPath = UIBezierPath()
        arcPath.addArc(withCenter: center,
                       radius: self.bounds.width/3,
                       startAngle: 5*CGFloat.pi/6,
                       endAngle: CGFloat.pi/6,
                       clockwise: true)
        UIColor.systemTeal.withAlphaComponent(0.2).setStroke()
        arcPath.lineWidth = 20
        arcPath.lineCapStyle = .round
        arcPath.stroke()
    }
    private func setUpLayer() {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let path = UIBezierPath()
        path.addArc(withCenter: center,
                       radius: self.bounds.width/3,
                       startAngle: 5*CGFloat.pi/6,
                       endAngle: CGFloat.pi/6,
                       clockwise: true)
        shapeLayer.path        = path.cgPath
        shapeLayer.strokeColor = UIColor.systemTeal.cgColor
        shapeLayer.fillColor   = UIColor.clear.cgColor
        shapeLayer.lineWidth   = 20
        shapeLayer.lineCap     = .round
        shapeLayer.strokeEnd   = 0.0
        layer.addSublayer(shapeLayer)
    }
    func animateGauge(to value: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = value
        animation.duration = 1.0
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeLayer.add(animation, forKey: "gaugeAnimation")
        self.progress = value
    }
}
