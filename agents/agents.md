# Code Style

- Avoid comments. Only add comments to code that makes nonobvious assumptions
- Prefer immutable, functional style unless specifically told otherwise
- Exception handling constructs (e.g. try/except or do/catch) should be as short as possible and only contain the code that throws
- Explicit is better than implicit: code should make assumptions obvious (and statically checked if possible)
- Never store state that isn't strictly necessary

# Language Specific Guidelines

When working with specific languages, use these files:

- Python: `~/dotfiles/agents/python.md`
- Swift: `~/dotfiles/agents/swift.md`