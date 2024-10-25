#  Rick & Morty iOS app

This application is an educational project developed to enhance my skills as an iOS mobile developer. This project focuses on improving my knowledge of API integration and UI design patterns in iOS development.

## Description

The app uses SwiftUI to create an engaging and interactive experience that allows users to explore characters from the Rick & Morty universe.

## Content

- Alamofire package.
- MVVM pattern.
- Clean Architecture folder structure.


## Architecture

```
RickAndMorty
├── Assets.xcassets
│   ├── AccentColor.colorset
│   │   └── Contents.json
│   ├── AppIcon.appiconset
│   │   ├── Contents.json
│   │   ├── rick_morty_icon_1024.png
│   │   ├── rick_morty_icon_152.png
│   │   └── rick_morty_icon_167.png
│   ├── Contents.json
│   ├── GreenR&M.colorset
│   │   └── Contents.json
│   └── Launch.imageset
│       ├── Contents.json
│       └── Rick_and_Morty_320.png
├── ContentView.swift
├── Data
│   └── DataSource
│       ├── CharacterDataSource.swift
│       └── CharacterDataSourceImpl.swift
├── Domain
│   ├── Model
│   │   ├── Character.swift
│   │   └── CharactersList.swift
│   ├── Repository
│   │   ├── CharacterRepository.swift
│   │   └── CharacterRepositoryImpl.swift
│   └── UseCases
│       └── GetAllCharactersUseCase.swift
├── FavAppDemoApp.swift
├── Info.plist
├── Presentation
│   ├── Components
│   │   ├── CharacterCard
│   │   └── LikeButton
│   ├── CharactersListView
│   │   ├── View
│   │   └── ViewModel
│   └── Pages
│       └── HomePage.swift
└── Preview Content
    └── Preview Assets.xcassets
        └── Contents.json
```
## Screenshots

<div>
![Launch screen](RickAndMorty/images/launch_screen.png)
![Favourite tab view empty](RickAndMorty/images/fav_tab_view_empty.png)
![Character list tab view](RickAndMorty/images/list_tab_view.png)
</div>

<div>
![Favourite tab view with characters](RickAndMorty/images/fav_tab_view.png)
![Character list tab view with favs](RickAndMorty/images/list_tab_view_stars.png)
</div>
