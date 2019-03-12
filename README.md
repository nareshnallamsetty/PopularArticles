# PopularArticles
This iOS application displays the list of most popular articles of NYTimes.

## Project setup, installation, and configuration
This sample source code and project has been developed with below tools and technologies.
IDE: Xcode 10.1, Programming Language: Swift 4.2, Design Pattern: VIPER, Tested iOS version: iOS 12.1.

### Prerequisites
Note that the Bundle ID for this iOS client is com.naresh.PopularArticles.

### Set up Popular Articles Xcode Project
Open PopularArticles project in Xcode
Open a new Finder window and navigate to the directory you have extracted the PopularArticles. Double click on the PopularArticles.xcworkspace file. It will open the project in Xcode automatically.

Look up the NYTimes secret API key, that corresponds to the Application that have been created in developer.NYTimes.com, update the following constant in the AppConstants.swift file in the PopularArticles project:

NY_TIMES_API_KEY (in line 13)

Build and Execute the PopularArticles Project
Follow the steps to set the simulator and run the application.

On the top left corner of the toolbar in Xcode, select `PopularArticles

choose the simulators with iOS 10 or greater than that. Click the Run` button to execute the app.

Switch to the iOS Simulator application from Xcode. You can now interact with the PopularArticles App.

On the first screen you can see the articles list, on tapping any article will take you to the Article details screen where you can see the details.
Take a Closer Look at PopularArticles App
set breakpoints in the following classes:

ArticlesListInteractor: fetchArticlesList,
ArticlesListPresenter: articlesListFetchedSuccess

These methods are responsible for making the requests to get the Articles information.
