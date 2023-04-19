# Marvel App

This app is a multi-platform Marvel app that displays five random characters in a carousel and a list of all characters in the Marvel Universe. The app was built using the Clean Architecture design pattern to separate business logic from presentation and data access. It also uses the Dio library to handle HTTP requests to the Marvel API.

## Getting Started

To use the app, you must have a Marvel API developer account and obtain an API key, API hash, and base URL. These values must be provided in a `.env` file at the root of the project directory to authenticate requests to the API. Here is an example of a `.env` file:

```
API_KEY=<your_api_key>
API_HASH=<your_api_hash>
BASE_URL=https://gateway.marvel.com
```

## Running the app

To run the app, follow these steps:

1. Clone the repository to your local machine.
2. Create a `.env` file in the root of the project directory with your Marvel API credentials (see above).
3. Run `flutter pub get` to install the required dependencies.
4. Run `flutter run` to start the app.

## Architecture

The app is built using the Flutter framework and uses MobX as the state management library. The code is organized into separate layers, with the presentation layer handling the user interface, the business logic layer handling app logic, and the data access layer handling API requests and database interactions.

```
lib/
├── home/
    ├── data/
    │   ├── datasource/
    ├── domain/
    │   ├── entity/
    │   ├── usecase/
    │   ├── datasource/
    └── presentation/
        ├── components/
        ├── controller/
        ├── screens/
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
