//
//  BoardGameController.swift
//  Cards
//
//  Created by Apple on 13.09.2023.
//

import UIKit

class BoardGameController: UIViewController {
    // количество пар уникальных карточек
    var cardsPairsCounts = 8
    // сущность "Игра"
    lazy var game: Game = getNewGame()
    // кнопка для запуска/перезапуска игры
    
    lazy var startButtonView = getStartButtonView()
    // игровое поле
    lazy var boardGameView = getBoardGameView()
    
    private func getBoardGameView() -> UIView{
        // отступ игрового поля от ближайших элементов
        let margin: CGFloat = 10
        
        let boardView = UIView()
        // указываем координаты
        // x
        boardView.frame.origin.x = margin
        // y
        let window = UIApplication.shared.windows[0]
        let topPadding = window.safeAreaInsets.top
        boardView.frame.origin.y = topPadding + startButtonView.frame.height + margin
        
        // рассчитываем ширину
        boardView.frame.size.width = UIScreen.main.bounds.width - margin*2
        // рассчитываем высоту c учетом нижнего отступа
        let bottomPadding = window.safeAreaInsets.bottom
        boardView.frame.size.height = UIScreen.main.bounds.height - boardView.frame.origin.y - margin - bottomPadding
        
        // изменяем стиль игрового поля
        boardView.layer.cornerRadius = 5
        boardView.backgroundColor = UIColor(red: 0.1, green: 0.9, blue: 0.1, alpha: 0.3)
        return boardView
    }
    
    @objc func startGame(_ sender: UIButton){
        print("button was pressed")
    }
    
    private func getStartButtonView() -> UIButton{
        // Создаем кнопку
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        // Изменяем положение кнопки
        button.center.x = view.center.x
        
        // получаем доступ к текущему окну
        let window = UIApplication.shared.windows[0]
        // определяем отступ сверху от границ окна до Safe Area
        let topPadding = window.safeAreaInsets.top
        // устанавливаем координату Y кнопки в соответствии с отступом
        button.frame.origin.y = topPadding
        
        // устанавливаем текст
        button.setTitle("Начать игру", for: .normal)
        // устанавливаем цвет текста для обычного (не нажатого) состояния
        button.setTitleColor(.black, for: .normal)
        // устанавливаем цвет текста для нажатого состояния
        button.setTitleColor(.gray, for: .highlighted)
        // устанавливаем фоновый цвет
        button.backgroundColor = .systemGray3
        // скругляем углы
        button.layer.cornerRadius = 10
        
        // подключаем обработчик нажатия на кнопку
        button.addTarget(nil, action: #selector(startGame), for: .touchUpInside)
        
        return button
        
    }
    
    private func getNewGame() -> Game{
        let game = Game()
        game.cardCount = self.cardsPairsCounts
        game.generateCards()
        return game
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(startButtonView)
        // добавляем игровое поле на сцену
        view.addSubview(boardGameView)
    }
    

}
