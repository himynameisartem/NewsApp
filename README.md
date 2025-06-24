# NewsApp

**NewsApp** is an iOS application that displays news using data fetched from the internet.  
The app is built using the **VIPER architecture**, utilizes **Alamofire** for networking, and employs a combination of **Storyboard** and **XIBs** for building a clean and responsive user interface.

## Features

- Browse the latest news articles
- Read detailed article content on a separate screen
- Clean, simple UI with support for reusable components
- Separation of concerns using VIPER

## Architecture

The project is implemented using **VIPER**, which separates the app into five layers:

- **View** – Displays the UI and handles user interaction
- **Interactor** – Contains business logic and data manipulation
- **Presenter** – Connects Interactor and View, formats data
- **Entity** – Represents data models
- **Router** – Manages navigation

This architecture improves testability, scalability, and code clarity.

## Networking

- Networking is handled using **Alamofire**, a powerful and modern HTTP networking library in Swift.
- The app fetches news data from a public news API (can be easily swapped or extended).
- JSON parsing is cleanly decoupled from the UI layer.

## Technologies

- **Swift**
- **VIPER architecture**
- **Alamofire** – HTTP networking
- **Storyboard + XIB** – UI layout
- **CocoaPods** – Dependency management
- **MVC-to-VIPER** experience transition

## Installation

1. Clone the repository:
   git clone https://github.com/himynameisartem/NewsAppVIPER
   
2. Install dependencies via CocoaPods:
   pod install

3. Open the .xcworkspace file in Xcode:
   open NewsApp.xcworkspace

4. Build and run the project.

## Contact

If you have any questions, suggestions or feedback, feel free to contact me:
📧 himynameisartem@icloud.com


# NewsApp

**NewsApp** — это iOS-приложение, отображающее новости, получаемые из сети.  
Проект построен на архитектуре **VIPER**, использует **Alamofire** для работы с сетью и сочетает **Storyboard** и **XIB-файлы** для создания гибкого и понятного интерфейса.

## Возможности

- Просмотр свежих новостей
- Детальный просмотр статьи на отдельном экране
- Чистый интерфейс с переиспользуемыми компонентами
- Разделение логики по слоям благодаря архитектуре VIPER

## Архитектура

Архитектура **VIPER** разбивает проект на 5 логических компонентов:

- **View** — отображение интерфейса и обработка взаимодействия
- **Interactor** — бизнес-логика и обработка данных
- **Presenter** — связывает Interactor и View, форматирует данные
- **Entity** — модели данных
- **Router** — отвечает за навигацию

Такой подход повышает читаемость кода, масштабируемость и тестируемость.

## Сетевое взаимодействие

- Все сетевые запросы выполняются через библиотеку **Alamofire**
- Загружаются новости с публичного новостного API
- Парсинг JSON изолирован от слоя интерфейса

## Технологии

- **Swift**
- **VIPER**
- **Alamofire** — сетевые запросы
- **Storyboard и XIB** — построение интерфейса
- **CocoaPods** — управление зависимостями

## Установка

1. Клонируйте репозиторий:
   git clone https://github.com/himynameisartem/NewsAppVIPER

2. Установите зависимости через CocoaPods:
   pod install

3. Откройте .xcworkspace файл в Xcode:
   open NewsApp.xcworkspace

4. Соберите и запустите проект.

## Связь

Если у вас есть вопросы, предложения или фидбек, напишите мне:
📧 himynameisartem@icloud.com
