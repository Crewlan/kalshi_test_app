# Financial Health Project

This project is a Flutter application that helps calculate users' financial health based on their annual income and monthly costs. To ensure code quality, the Clean Architecture pattern and Flutter Bloc and GetIt libraries are used for dependency injection, unit testing, and widget testing.

## Functionalities

- Calculate financial health based on annual income and monthly costs.
- Displays different financial states (healthy, average, low) based on costs relative to income.

## Technologies Used

- Flutter Bloc
- Get it
- Mocktail
- Equatable
- SVG
- Fonts and Images

## Tests Coverage
![Coverage](https://drive.google.com/uc?id=19jpM3Hz6pmvugyo4u5Mz52K5MytQ2ZLs)

### Running Tests
To run the tests for this project, use the following command:

```bash
flutter test
```
To generate a code coverage report while running tests, use:

```bash
flutter test --coverage
```
This will generate a coverage report in the coverage/lcov.info file.

Viewing Code Coverage
To view the code coverage report using LCOV:

### Install LCOV:

Ensure LCOV is installed on your system. You can typically install it using your package manager.
Generate HTML Report:

- Use LCOV to generate an HTML report from the coverage data.

Open the HTML Report:
```bash
genhtml coverage/lcov.info -o coverage/html
````
- Open the generated HTML report in your web browser:
./coverage/html/index.html
This report provides a detailed view of your code coverage metrics.

### Project Dependencies

- **bloc:** ^8.1.4
- **cupertino_icons:** ^1.0.6
- **equatable:** ^2.0.5
- **flutter_bloc:** ^8.1.6
- **flutter_svg:** ^2.0.10+1
- **get_it:** ^7.7.0

## Setting Up and Running the Project

### Setting Up Your Environment

#### Step 1: Install Flutter

This project use 3.22.1 Version.
Make sure you have Flutter installed on the latest stable version. You can download it and follow the installation instructions [here](https://flutter.dev/docs/get-started/install).

#### Step 2: Clone the Repository

Clone this repository using the following command:

```bash
git clone https://github.com/Crewlan/kalshi_test_app.git

```
This will create a local copy of the project in your current directory.

Running the Project in Your IDE
#### Step 3: Open the Project
Open your preferred IDE (such as VS Code, Android Studio, IntelliJ, etc.) and load the kalshi_test_app project that you just cloned.

#### Step 4: Run the Project
Make sure you have an emulator set up or a physical device connected.
Run the project by pressing the run button in your IDE or using the flutter run command in the terminal at the root of the project.

