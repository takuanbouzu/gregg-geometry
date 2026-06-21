# GF Design System — Claude Design export

This folder is the **sync bundle** for the claude.ai/design design-system project.
It mirrors the canonical design system so the Design pane can render each component
as a preview card.

## Contents

- `components/*.html` — one self-contained preview per component, each with a
  first-line `<!-- @dsCard group="…" name="…" -->` marker the Design pane compiles
  into a card. **These are the only hand-maintained files here.**
- `gf-tokens.css`, `gf-nav.js` — **generated** copies of `../assets/*`, produced by
  `build.sh`. They are git-ignored (see `/.gitignore`); never edit or commit them.
  `../assets/` is the single source of truth, so the bundle can't drift from the system.

## Cards

| File | Group | Component |
|------|-------|-----------|
| `components/colors.html` | Foundation | Color tokens (dark · light · geometry roles) |
| `components/typography.html` | Foundation | Type scale |
| `components/nav.html` | Components | Responsive nav + hamburger |
| `components/cards.html` | Components | Card list |
| `components/buttons.html` | Components | Buttons |
| `components/chips.html` | Components | Chip row |
| `components/confidence-tags.html` | Components | Confidence tags |

## Syncing

Refresh the generated assets, then push incrementally (one component at a time):

```sh
./build.sh        # regenerate gf-tokens.css + gf-nav.js from ../assets
/design-sync      # create/select the project, finalize a plan, write_files
```

`build.sh` is the only step that touches the asset copies — run it before every
sync so the previews match the live system.
