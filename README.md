# Weather

## Description
Weather provides the current weather forecast for any city and includes a 5-day weather forecast. The app offers an easy-to-use interface to check both current weather conditions and upcoming forecasts.
 
## Prerequisties/ Installtion
1. Xcode 15 or later.
2. macOS Ventura 13.6.9 or later.
3. Install Cocoapods (https://guides.cocoapods.org/using/getting-started.html)
4. Run pod install in the app directory
 
## How to run the APP
1. To clone the Git repository to your local machine, you can either use the command line with git clone "repo url" or download it as a ZIP file. To download the ZIP, click on "Code" in the top right corner and select "Download ZIP."
2. After installing the xcode, navigate to the Weather folder and open the Weather.xcworkspace file. This will open the project in Xcode.
3. Select a simulator from the device selector in the toolbar.
4. Click the Play icon in the top left corner to run the app in the simulator.
 
 
## How to use the app
1. Enter the name of a city and tap the Search button.
2. The app will display the current weather conditions for the selected city.
3. Tap the link at bottom of screen to see 5 days forecast. This will navigate to a new screen showing the weather forecast for the next 5 days, including today.
 
## How to execute test
 
1. Open the project in Xcode by navigating to the Weather folder and selecting the Weather.xcworkspace file.
2. In Xcode, select Product from the menu bar.
 
3. Choose Test or press Cmd + U on your keyboard. This will run all unit tests and display the results in the Xcode console.
 
4. You can view individual test cases and their results in the Test Navigator (accessible via the left-side panel in Xcode).
 
5. Alternatively, you can execute specific tests by clicking on the diamond symbol next to individual test methods or classes in the code editor.


## Technology Used

1. SwiftUI: For building user interfaces
2. Swift: The programming language used 
3. Xcode: The official integrated development environment (IDE) for macOS used to build, debug, and deploy the app.
4. Alamofire: For network calls
5. CocoaPods: For managing third-party libraries and dependencies.
6. Design Pattern: MVVM

## Folder Structure

1. View - Contains all the screens/components developed using swiftui
2. ViewModel - Contains ViewModel class which have buisness logic also act as mediator between view and model
3. Model - Contains Model classes for all server and local data
4. Network - Contains network class for making API calls
5. Storage - Contains stoarge class for caching the API data
6. Utility - Contains constant file and some utility functions








 
# Weather
