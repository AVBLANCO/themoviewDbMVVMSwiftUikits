# themoviewDbMVVMSwiftUikits

## Overview
themoviewDbMVVMSwiftUikits is a Swift project that uses the MVVM architecture to fetch and display top-rated and popular movies from the The Movie Database (TMDB) API.

![Overview Image](https://i.ytimg.com/vi/nWSHWWV8Nas/maxresdefault.jpg)

## Architecture
The project is built using the Model-View-ViewModel (MVVM) architecture, which separates the concerns of the application into three main components:

- **Model:** Responsible for handling the data and business logic of the application.
- **View:** Responsible for rendering the user interface and handling user input.
- **ViewModel:** Acts as an intermediary between the Model and View, providing data to the View and handling user input.

## Components
The project consists of the following components:

- **API:** Handles token and authorization for API endpoints.
- **TopRated:** Displays a list of top-rated movies.
- **Popular:** Displays a list of popular movies.
- **DetailView:** Displays the details of a single movie.
- **Unit test:** The project contains unit tests using XCTest, testing ViewModel and ViewController and other components (API and ImageLoader).

## Images
![Image from GitHub](https://github.com/AVBLANCO/themoviewDbMVVMSwiftUikits/blob/main/Support/Simulator%20Screenshot%20-%20iPhone%2015%20Pro%20-%202024-05-23%20at%2007.57.08.png?raw=true)
![Additional Image](https://github.com/AVBLANCO/themoviewDbMVVMSwiftUikits/blob/main/Support/AdditionalImage.png?raw=true)

## Video
[Video from GitHub](https://github.com/AVBLANCO/themoviewDbMVVMSwiftUikits/tree/main/Support#:~:text=Simulator%20Screen%20Recording%20%2D%20iPhone%2015%20Pro%20%2D%202024%2D05%2D23%20at%2007.58.07.mp4)



## Testing
The project includes unit tests for the following components:

- **TopRatedViewController:** Tests the setup of the top-rated view controller.
- **FetchTopRatedMovies:** Tests the fetching of top-rated movies.
- **SearchBarDelegate:** Tests the search bar delegate.
- **CollectionViewDataSource:** Tests the collection view data source.

## Getting Started
To get started with the project, follow these steps:



1. Clone the repository this url https://github.com/AVBLANCO/themoviewDbMVVMSwiftUikits.git
2. Open the project in Xcode.
3. Run the project to see the top-rated movies.

## License
This project is licensed under the MIT License.
