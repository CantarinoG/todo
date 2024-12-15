# Flutter SQLite Todo App

A Flutter application demonstrating CRUD operations using SQLite database with a clean architecture approach.

## Features

- Create, Read, Update, and Delete todo tasks
- Mark tasks as complete/incomplete
- Persistent storage using SQLite
- Clean architecture with Provider pattern
- Generic DAO implementation

## Architecture

The application follows a clean architecture pattern with the following components:

### Data Layer
- `DatabaseHelper`: Abstract interface for database operations
- `SqfliteDatabaseHelper`: SQLite implementation of DatabaseHelper
- `Dao`: Generic Data Access Object interface
- `TaskDAO`: Implementation of Dao for Task entities

### Models
- `Task`: Data model representing a todo task

### Providers
- `IdProvider`: Interface for generating unique IDs
- `IdProviderDt`: DateTime-based implementation of IdProvider
- `ObjectProvider`: Generic provider interface for CRUD operations
- `TaskProvider`: Implementation of ObjectProvider for Task entities

### UI
- `HomeScreen`: Main screen displaying list of tasks
- `TaskFormScreen`: Form for creating/editing tasks
- `TaskTile`: Widget for displaying individual tasks

## Usage

- Tap the floating action button to add a new task
- Tap the check icon to toggle task completion
- Tap the edit icon to modify a task
- Tap the delete icon to remove a task
