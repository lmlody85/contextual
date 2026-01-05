# Contributing to Contextual

Thank you for your interest in contributing! This is a template/framework project, and contributions help make it better for everyone building AI-assisted projects.

## Ways to Contribute

### 1. Share Your Experience

Open an issue to share:
- How you're using this system in your project
- What worked well
- What could be improved
- Suggestions for additional features

### 2. Report Bugs

Found something that doesn't work as documented? Please:
- Open an issue with a clear title
- Describe what you expected vs what happened
- Include relevant file paths or screenshots
- Mention which AI tool you're using (Claude Code, Cursor, etc.)

### 3. Suggest Improvements

Have ideas for better ways to organize or validate? Please:
- Open an issue with your proposal
- Explain the problem it solves
- Provide examples if possible
- Discuss trade-offs

### 4. Add AI Tool Support

Help support more AI coding assistants:
- Create example configurations for Cursor, Copilot, Aider, etc.
- Document tool-specific optimizations
- Test the system with different AI tools
- Share lessons learned

### 5. Write Guides

Help others adopt this system:
- Migration guides from other documentation systems
- Best practices for specific use cases
- Integration guides (CI/CD, GitHub Actions, etc.)
- Video tutorials or blog posts

## Pull Request Process

### Before Submitting

1. **Check existing issues/PRs** - Avoid duplicating work
2. **Open an issue first** - Discuss major changes before implementing
3. **Test your changes** - Verify with at least one AI tool
4. **Update documentation** - Keep docs in sync with changes

### PR Guidelines

1. **Clear title** - Describe what the PR does
2. **Detailed description** - Explain why and how
3. **Reference issues** - Link to related issues
4. **Keep it focused** - One feature/fix per PR
5. **Follow structure** - Match existing documentation format

### Example PR Template

```markdown
## Description
Brief description of changes

## Motivation
Why is this change needed?

## Changes Made
- Added/Updated/Fixed X
- Modified Y
- Created Z

## Testing
How did you test this?
- [ ] Tested with Claude Code
- [ ] Tested with Cursor
- [ ] Validated docs structure
- [ ] Checked all links

## Related Issues
Closes #123
```

## Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome diverse perspectives
- Focus on constructive feedback
- Help others learn and grow

### Unacceptable Behavior

- Harassment or discrimination
- Trolling or insulting comments
- Political or off-topic discussions
- Spam or self-promotion

## Documentation Standards

When contributing documentation:

### Writing Style

- ✓ Clear and concise
- ✓ Use examples
- ✓ Avoid jargon
- ✓ Active voice
- ✗ Don't assume knowledge
- ✗ Don't use complex terminology without explanation

### Formatting

- Use proper markdown formatting
- Include code blocks with syntax highlighting
- Add diagrams where helpful (ASCII art or images)
- Keep line length reasonable (< 120 characters)

### Structure

- Follow existing templates
- Keep docs self-contained
- Link to related docs
- Update indexes when adding files

## Development Workflow

### For Documentation Changes

```bash
# 1. Fork the repository
# 2. Create a branch
git checkout -b docs/improve-feature-template

# 3. Make your changes
# 4. Test with AI tool
# 5. Validate documentation
#    (if using Claude Code, say "validate docs")

# 6. Commit with clear message
git commit -m "docs: Improve feature template with better examples"

# 7. Push and create PR
git push origin docs/improve-feature-template
```

### For Template Changes

```bash
# 1. Fork and branch as above
git checkout -b feature/add-cursor-support

# 2. Add your changes
# 3. Test thoroughly with target AI tool
# 4. Update README.md if needed

# 5. Commit and push
git commit -m "feat: Add Cursor AI configuration example"
git push origin feature/add-cursor-support
```

## Commit Message Guidelines

Use conventional commits format:

```
type(scope): subject

body (optional)

footer (optional)
```

**Types:**
- `feat:` - New feature or template addition
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `refactor:` - Code/structure changes without feature changes
- `test:` - Testing improvements
- `chore:` - Maintenance tasks

**Examples:**
```
feat(claude): Add docs-validator sub-agent
docs(readme): Improve quick start section
fix(template): Correct feature dependency format
```

## Testing Guidelines

### For Template Changes

1. Create a test project using the template
2. Test with at least one AI tool
3. Verify all links work
4. Check documentation validates correctly
5. Ensure structure is clear

### For AI Tool Configurations

1. Test with the actual AI tool
2. Verify tool reads the configuration
3. Check workflows work as documented
4. Test validation procedures
5. Document any limitations

## Questions?

- Open an issue with the `question` label
- Join discussions in GitHub Discussions
- Tag maintainers if urgent

## Recognition

Contributors will be:
- Listed in release notes
- Mentioned in acknowledgments
- Added to contributors list (if significant contribution)

Thank you for helping improve this project!
