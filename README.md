# flutter_handy_utils

The `flutter_handy_utils` package is a **community-driven** project designed to simplify common tasks in Flutter development. It offers a wide range of utility functions and extensions that make building Flutter apps more efficient. Below is everything you need to know about using, contributing, and staying involved with the package.

## Features

- structured parent-child relationships

## Usage

### TreeBuilder:

creating structured parent-child relationship using the `TreeBuilder` util.

1. make a list of `TreeInputItem`:

   ```dart
   final list = [
      TreeInputItem<T>(id: int, parentId: int, data: <T>)
      TreeInputItem<T>(id: int, parentId: int, data: <T>)
      TreeInputItem<T>(id: int, parentId: int, data: <T>)
   ];
   ```

2. create an instance of TreeBuilder with the given type:

   ```dart
   final treeBuilder = TreeBuilder<T>();
   ```

3. make the structured parent-child relationship using:

   ```dart
   final result = treeBuilder.buildTree(list);
   ```

the result will be a list of `TreeOutPutItem` that includes the parent and its children and the depth of each item

---

## Additional information

## 📖 Where to Find More Information:

- **Official Documentation**: Find comprehensive details, usage examples, and release notes on [**pub.dev**](https://pub.dev/).
- **API Documentation**: For in-depth API details, visit the [GitHub repository](https://github.com/) or explore the package page on Pub.dev.
<!-- TODO: add the repository and pub.dev link -->

## 🤝 How to Contribute:

Contributions are always welcome! You can get involved in a variety of ways:

1. **Fork the Repository**:
   - Start by forking the [GitHub repository](https://github.com/) to your account.
2. **Create a New Branch**:
   - Make your improvements, whether it's bug fixes, new features, or enhancing the documentation.
3. **Submit a Pull Request**:
   - Once done, submit a PR with a detailed explanation of the changes.

### 🔧 Code Standards:

- Ensure that your code follows the project's coding style and conventions.
- Contributions should be accompanied by **unit tests** to ensure the stability of the package.

## 🐛 Filing Issues:

Encounter a problem or have a suggestion? You can:

- **Report Bugs**: Head to the **GitHub Issues page** and provide detailed information, including:
  - Your Flutter version
  - Steps to reproduce the issue
  - Any relevant logs or error messages
- **Request New Features**: If you have ideas for improvements or new utilities, feel free to submit a **feature request** via the GitHub Issues page.

## 📬 Response from the Package Authors:

- **Issue Response Time**: The maintainers strive to respond to issues within a few days. However, complex issues may take longer to resolve.
- **Community Involvement**: Other contributors may also assist with questions, issues, and pull request reviews.

## 🌟 Getting More Involved:

- **Leave Feedback**: Your feedback helps shape the future of the package. Feel free to leave comments and reviews on the [**Pub.dev page**](https://pub.dev/).
- **Join Discussions**: If you have general questions, ideas, or want to collaborate, consider participating in **GitHub Discussions** if available.

---

By contributing to `flutter_handy_utils`, you become part of a community dedicated to making Flutter development smoother and more efficient for everyone!
