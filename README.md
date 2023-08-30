# TimesNews App


## Description

The app lets you fetch data from NYTimes API and present it on UI app. 
When the app still fetch data, you can see ProgressView on the center app.
App also can switch dark mode and light mode, tap in NavigationBar leading Button also can save that data after closing app. 
You can filter in fetched data with SearchBar. 
There are two Buttons on the trailing NavigationBar and on the Left Button lets you present data as a list and the Right
Button lets you change presentation as a three types of grids with animation.
And you can tap in the items of list or grid and navigate to DetailView. 
There is a more information about the Article. And there is link, where you can tap and navigate to the page of NYTimes for more information about the article.

## Getting started
When you tap on the app, it is starting and you can see custom UI on launch screen in the app. After that first view is uploading on the app, it is MainView(You can see Main View in the View folder). 
And before fetching data from network you can see Progress View in the center screen. After loading data Progress View is hiding and you can see data with List.

## Helper
There is a class SoundPlayer in the Helper folder. This class use for play sound, when user taps on the Buttons of NavigationBar in the MainView. 
For this class I use Singleton pattern.

## App
There is a app lunch file in the App folder.

## Sound
There is a sound in the sound folder.

## Extension
There is a view extension in the Extension folder. It uses for change foreground color of some views, example - Text.

## Modifier
There is a CenterModifier in the Modifier folder. It uses for put view on the center of the parent view.

## Network
There is a NetworkRequest class in the Network folder. It uses for fetching data from the network.

## View
There are all of UI elements in the View and SubView folders.

## ViewModel
There is a MainViewModel in the ViewModel folder. It is use for update UI when the data is changed.
It is important part of MVVM architecture.

## Data
There is a mockData in the Data folder, for presenting it in the some views.
