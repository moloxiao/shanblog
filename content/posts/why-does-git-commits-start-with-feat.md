# Why Does Git Commits Start with `feat:`?

Have you ever seen `feat:` at the beginning of Git commit messages when using Copilot or other AI-assisted tools? If you're wondering why developers use this format, the answer lies in **Conventional Commits**—a structured way of writing commit messages that improves project maintainability and automation.

## 1. What is Conventional Commits?

Conventional Commits is a standardized format for Git commit messages, designed to make change history clearer and more structured. A typical commit follows this pattern:

```bash
<type>(<scope>): <description>
```

- ``: Specifies the type of change, such as `feat`, `fix`, or `docs`.
- ``: Optional, indicates the area of the codebase affected (e.g., `models`, `UI`).
- ``: A short summary of the change.

Example commit messages:

```bash
feat(models): add BuilderJobItem and BuilderJobItemParams with relationships
fix(ui): resolve login button issue on mobile
```

## 2. Why Use Conventional Commits?

### ✅ **Improves Readability**

A well-structured commit history allows developers to quickly understand what changes have been made and their purpose. Compare the following:

```bash
feat: add new authentication flow
fix: correct calculation bug in sales report
refactor: optimize query performance in UserRepository
```

Versus an unstructured approach:

```bash
add new auth feature
fix bug
optimize db query
```

The first format makes it immediately clear which commits introduce new features, fix bugs, or refactor code.

### ✅ **Automated Changelog Generation**

By consistently using `feat:`, `fix:`, and other prefixes, tools like `commitizen` and `semantic-release` can automatically generate a `CHANGELOG.md` file:

```markdown
# Changelog

## 1.2.0 (2024-03-20)
### Features
- Add new reporting feature

### Bug Fixes
- Correct calculation bug in sales report
```

### ✅ **Supports Semantic Versioning**

Conventional Commits integrate seamlessly with **Semantic Versioning** (SemVer):

- `feat:` → Triggers a **minor version** bump (`1.1.0 → 1.2.0`).
- `fix:` → Triggers a **patch version** bump (`1.1.0 → 1.1.1`).
- `BREAKING CHANGE:` → Triggers a **major version** bump (`1.1.0 → 2.0.0`).

## 3. Common Commit Types

| **Prefix**  | **Purpose**                                                                  |
| ----------- | ---------------------------------------------------------------------------- |
| `feat:`     | Introduces a new feature                                                     |
| `fix:`      | Fixes a bug                                                                  |
| `refactor:` | Refactors code without changing functionality                                |
| `docs:`     | Documentation changes only                                                   |
| `style:`    | Formatting changes (e.g., indentation, semicolons) with no functional impact |
| `test:`     | Adds or modifies tests                                                       |
| `chore:`    | Maintenance tasks like build scripts and CI/CD changes                       |
| `perf:`     | Performance improvements                                                     |
| `ci:`       | Continuous Integration (CI/CD) changes                                       |

## 4. How to Implement This in Your Project

### **(1) Manually Writing Commit Messages**

For small teams, simply agreeing to follow the convention is enough:

```bash
git commit -m "feat: add user authentication"
git commit -m "fix: resolve login issue on mobile"
```

### **(2) Enforcing with **``

Install `commitizen` to guide developers through commit formatting:

```bash
npm install -g commitizen
commitizen init cz-conventional-changelog --save-dev --save-exact
```

Use it when committing:

```bash
npx cz
```

### **(3) Enforcing with **``** + **``

To ensure all commits follow the rules, add `commitlint` with Git hooks:

```bash
npm install --save-dev @commitlint/{config-conventional,cli}
echo "module.exports = {extends: ['@commitlint/config-conventional']};" > commitlint.config.js
npx husky install
npx husky add .husky/commit-msg "npx --no -- commitlint --edit $1"
```

This will block any commit messages that don't adhere to the `feat:` and `fix:` format.

## 5. Conclusion

Using `feat:` in commit messages is part of the **Conventional Commits** standard, which enhances readability, enables automated changelogs, and integrates with Semantic Versioning. By adopting this convention manually or through automation tools, you can ensure a more structured and maintainable Git history.

If your team hasn’t adopted this yet, give it a try on your next commit! 🚀

