//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
        
        // создаем кривые на сцене
        createBezier(on: view)
        
    }
    
    private func createBezier(on view: UIView){
        // создаем графический контекст (слой)
        let shapeLayer = CAShapeLayer()
        // добавляем слой в качестве дочернего к корневому слою корневого представления
        view.layer.addSublayer(shapeLayer)
        
        // изменение цвета линий
        shapeLayer.strokeColor = UIColor.gray.cgColor
        // изменение толщины линий
        shapeLayer.lineWidth = 5
        // определение фонового цвета
        shapeLayer.fillColor = UIColor.green.cgColor
        
        // создание фигур
        let combinedPath = UIBezierPath()
//        combinedPath.append(getPath())
        combinedPath.append(Rect())
        combinedPath.append(Oval())
        combinedPath.append(Curve())
        
        shapeLayer.path = combinedPath.cgPath
    }
    
    private func getPath() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 50))
        path.addLine(to: CGPoint(x: 150, y: 50))
        
        // создание второй линии
        path.addLine(to: CGPoint(x: 150, y: 150))
        // завершение фигуры
        path.close()
        
        
        // создание второго треугольника
        path.move(to: CGPoint(x: 50, y: 70))
        path.addLine(to: CGPoint(x: 150, y: 170))
        path.addLine(to: CGPoint(x: 50, y: 170))
        path.close()
        
        return path
    }
    
    private func Rect() -> UIBezierPath{
        // создание сущности "Прямоугольник"
        let rect = CGRect(x: 160, y: 210, width: 200, height: 100)
        // создание прямоугольника
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 15)
        
        return path
    }
    
    private func Oval() -> UIBezierPath{
        let rect = CGRect(x: 50, y: 320, width: 200, height: 100)
        let path = UIBezierPath(ovalIn: rect)
        return path
    }
    
    private func Curve() -> UIBezierPath{
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addCurve(to: CGPoint(x: 200, y: 200), controlPoint1: CGPoint(x: 200, y: 20),
                     controlPoint2: CGPoint(x: 20, y: 200))
        return path
    }
    
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
