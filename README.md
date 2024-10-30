# drive2ibiza

Car Sharing and Organizing App.


# TODO

Create a meaningful README.



## Project Structure

```
drive2ibiza/
├──assets/
│   ├── icon/
│   └── img/
├── lib/
│    ├── main.dart                   // Entry point of the app
│    ├── app.dart                    // Main app widget configuration
│    ├── config/                     // App-wide configurations
│    ├── models/                     // Data models
│    ├── pages/                      // Separate pages for each screen
│    │   ├── calendar_page.dart
│    │   ├── map_page.dart
│    │   ├── settings_page.dart
│    │   └── home.dart               
│    ├── widgets/                    // Reusable UI components
│    ├── services/                   // Services (API, location, authentication)
│    └── utils/                      // Utility functions or constants
└── pubspec.yaml                    
```
## Explanation of Each File/Folder
	•	main.dart: The entry point of the application. It initializes the app by calling runApp and setting up the main app widget.
	•	app.dart: A wrapper around MaterialApp to centralize theme and navigation settings. This could include configuration for light/dark themes or route management if the app grows.
	•	pages/ Folder: Each page within the navigation bar will have its own Dart file, making the app more modular.
	•	calendar_page.dart: Code specific to the calendar screen.
	•	map_page.dart: Code specific to the map screen.
	•	settings_page.dart: Code specific to the settings screen.
	•	home.dart: Main navigation page with NavigationBar, handling navigation and setting the currentPageIndex. This file could contain logic to load the correct page based on the selected index.
	•	widgets/ Folder: Holds reusable components, like buttons, cards, or custom app bars, that can be used across different pages. For example, if you have custom calendar or map widgets, put them here.
	•	models/ Folder: If the app deals with data (like calendar events, user settings, etc.), define data models here for better type-safety and structure. Models can be converted from and to JSON if they interact with APIs.
	•	services/ Folder: This folder will house any service logic like API calls, location handling, or authentication functions. Separating services ensures that your UI remains focused on display logic, while backend interactions are centralized.
	•	utils/ Folder: Any constants, formatters, or helper functions can go here. For example, utility functions for date formatting or common UI colors/styles.
