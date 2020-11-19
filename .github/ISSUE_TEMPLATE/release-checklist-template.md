---
name: Release Checklist Template
about: A checklist for release preparation
title: Release X.X.X
labels: ''
assignees: ''

---

### Prepare Release
- [ ] Manual checks for features, with release tag
- [ ] Code complete freeze
- [ ] All code in release tagged, following semver
- [ ] Release notes drafted and linked
- [ ] QA for new release
  - [ ] Manual checks validated in `qa`
  - [ ] Automated tests green in `qa`

If applicable:
- [ ] Environments prepped for release
- [ ] Statuspage announcement of release
- [ ] Customer docs prepped

### Perform Release
- [ ] OK from team
- [ ] Manual checklists validated on prod
- [ ] Automated tests are green
- [ ] Release notes published

If applicable:
- [ ] Customer docs published
- [ ] Statuspage Release completion
