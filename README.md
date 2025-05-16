# 💸 Flutter Expense Tracker App

A simple and efficient expense tracking application built with Flutter. This app allows users to record their daily expenses, view and edit them, and see a **monthly spending report** with comparisons against previous months.

---

## 📱 Features

- ✅ Add new expenses (category, amount, date, description)
- 📝 Edit existing expenses
- ❌ Delete expenses
- 📋 View all expenses in a list
- 📊 Monthly report with comparison to previous months
- 🧭 Bottom Navigation Bar with:
  - Home tab
  - Expense List tab
  - Report tab
- 🎨 Clean, responsive UI built with Material Design

---

## 📷 Screenshots

> *(Add emulator screenshots here once ready)*

---

## 🛠️ Tech Stack

- **Flutter** (UI framework)
- **Dart** (programming language)
- State management using `setState`
- Local storage (in-memory for now — can be extended to SQLite/Shared Preferences)

---

## 🚀 Getting Started

### Prerequisites

Before running the app, make sure you have the following installed on your system:

- ✅ [Flutter SDK](https://flutter.dev/docs/get-started/install)
- ✅ Android Studio (for emulator or AVD setup)
- ✅ Visual Studio Code (or any preferred IDE with Flutter support)
- ✅ A device: either an Android emulator or a physical device

---

### 📦 Installation Steps

Follow these steps to run the project on your local machine:

1. **Clone the repository**:

```bash
git clone https://github.com/yourusername/expense_tracker_flutter.git
cd expense_tracker_flutter
```

2. **Get Flutter dependencies**:

```bash
flutter pub get
```

3. **Run the app**:

```bash
flutter run
```

You will be prompted to select a device. Choose either your emulator or physical device.

---

## 🗂️ Project Structure

```
lib/
├── main.dart                # Entry point of the app
├── models/
│   └── expense.dart         # Expense data model
├── screens/
│   ├── home_screen.dart     # Contains bottom navigation and routing
│   ├── home_tab.dart        # Home welcome/info screen
│   ├── expense_list_tab.dart # List of all expenses
│   └── report_tab.dart      # Monthly report screen
├── widgets/
│   ├── expense_form.dart    # Add/Edit expense form
│   ├── expense_list.dart    # Widget for displaying expenses
│   └── monthly_report.dart  # Widget for monthly comparison chart
```

---

## 🧭 Navigation

The app uses a bottom navigation bar to switch between:

- **🏠 Home** – App introduction or summary
- **🧾 Expense List** – Displays all expenses with edit and delete buttons
- **📈 Report** – Monthly expense summary with comparisons

---

## 🧪 Testing the App

- Try adding different expenses for different months.
- Use the **edit icon** to update any existing expense.
- Use the **delete icon** to remove an expense.
- Switch tabs to see the report update dynamically.

---

## ✨ Future Improvements

- Persist data using `Hive` or `SQLite`
- Add category filters and sorting options
- Export monthly report as PDF
- User login for syncing expenses with the cloud
- Advanced charts using `fl_chart` or `charts_flutter`

---

## 🧑‍💻 Author

**Ningthoujam Rabichand Singh**  
Flutter Developer & Student  

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

