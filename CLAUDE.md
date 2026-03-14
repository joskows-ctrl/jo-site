# JonahOskow.com — Design Options

## What This Is
Design options for **JonahOskow.com** — personal portfolio site for Jonah Oskow, film & commercial editor.
**Completely separate from Highly Appropriate (ha.highlyappropriate.com).**

## Person
- **Name:** Jonah Oskow
- **Role:** Film & Commercial Editor
- **Specialties:** Comedy, Social Media, Film/Episodic, AI Direction
- **Email:** joskows@gmail.com
- **Domain:** jonahoskow.com

## Structure
Each `option-N.html` is standalone and self-contained. No build step.
4 work categories: Comedy, Social Media, Film/Episodic, AI Direction
1 About section per file.

## Assets (BunnyCDN — placeholders until real assets uploaded)
- Placeholder video: `https://highly-appropriate.b-cdn.net/HA%20reel/individualshots/BGReel.mp4`
- Spokesman video: `https://highly-appropriate.b-cdn.net/WeAreJonah_0305.mp4` (0:37 intro)
- Portrait: `https://highly-appropriate.b-cdn.net/portraits/jonah.jpg`
- No logo — name is typography only

## To Run Locally
```
cd C:\Users\josko\Documents\JONAHOSKOW\jo-site
python -m http.server 4201
# Then open: http://localhost:4201/option-45.html
```

## Deployment
- Git: https://github.com/joskows-ctrl/jo-site
- Domain: jonahoskow.com (not yet configured on Netlify)
- Netlify: TBD — connect repo once design is chosen

## Options Overview

### Batch 1 (options 1–10) — Initial exploration
| # | Name | Style |
|---|------|-------|
| 1 | REEL | Full-screen video hero, dark cinematic |
| 2 | SPLIT | Fixed left panel / scrolling right |
| 3 | EDITORIAL | White, large serif, magazine grid |
| 4 | HOVER REVEAL | Minimal nav, thumbnails materialize on hover |
| 5 | CHAPTERS | Full-viewport snap-scroll sections |
| 6 | LUXURY DARK | Ultra refined dark, gold accents |
| 7 | KINETIC | Animated type, scroll-triggered reveals |
| 8 | MAGAZINE GRID | Asymmetric editorial grid |
| 9 | INDEX | Minimal list view, hover reveals thumbnail |
| 10 | IMMERSIVE | Scattered layout, full-screen video on hover |

### Batch 2 (options 11–15) — Option-7 colors + option-10 layout hybrid
| # | Name | Style |
|---|------|-------|
| 11–15 | HYBRID | Deprecated — video chaos, superseded by 16–25 |

### Batch 3 (options 16–25) — VideoManager pattern, thumbnails as selectors
| # | Name | Style |
|---|------|-------|
| 16–25 | VIDEOMANAGER | Left-fixed panel, right scroll — superseded by 26–45 |

### Batch 4 (options 26–45) — Fresh from scratch, 20 completely new layouts ⭐ CURRENT
| # | Name | Vibe |
|---|------|------|
| 26 | WORK FIRST | Pure black/white, immediate grid, zero hero — work visible instantly |
| 27 | ONE AT A TIME | Full-screen single card, ←→ arrow nav, red accent (Bebas Neue) |
| 28 | HORIZONTAL REEL | Scroll left-to-right like a film strip, film-yellow top bar |
| 29 | WHITE EDITORIAL | Massive italic Playfair Display, white bg, hover inverts to black |
| 30 | STACKED CARDS | Swipeable card deck, mint green accent, swipe/click to discard |
| 31 | FILM FRAME | Letterbox bars, live 24fps timecode ticker, film perfs, scanlines |
| 32 | DRAMATIC REVEAL | Scroll-snapped, name sequences in, red progress spine |
| 33 | NEWSPAPER BROADSHEET | Newsprint cream, masthead, broadsheet columns, editorial drop cap |
| 34 | TWO COLUMN PARALLEL | Dark left bio / light right work, both columns scroll independently |
| 35 | NAMES AS ARCHITECTURE | Category names at 28rem, bg flips on hover, thumbnails understated |
| 36 | DARK LUXURY | #0a0a0a + gold, Playfair serif, sticky left nav, fade-in grid |
| 37 | CURSOR GALLERY | White minimal, custom cursor morphs, accordion categories |
| 38 | TIMELINE | Vertical center spine, alternating cards, IntersectionObserver reveals |
| 39 | CATEGORY SPOTLIGHT | 2×2 viewport quadrants, click to expand, thumbnail tray slides up |
| 40 | FILM GRAIN TEXTURE | Warm cream, SVG feTurbulence grain, film-strip frame, accordion |
| 41 | WORK AS BACKGROUND | BGReel.mp4 fullscreen hero, tabs slide frosted panel up |
| 42 | FULL SCREEN TRANSITIONS | Deep navy scroll-snap panels, dot nav, IntersectionObserver |
| 43 | DARK NAVY + WARM | #0f1923 + amber #e8813a, Oswald condensed, sticky tab switcher |
| 44 | MAGAZINE FEATURE | White, Playfair Display, 4-column work grid, portrait float |
| 45 | TERMINAL LUXURY | Pure black, IBM Plex Mono, blinking cursor, accordion categories |

## Style Direction
- Fresh, modern, high-end, interactive
- Looks like a web design firm built it
- Bold but not noisy
- No logo — name is the identity
- Single fullscreen modal for all video (openVideo() pattern)
- No inline video players — thumbnails are dark divs with ▶

## Rules
- Never delete existing options
- Each file is self-contained (no external CSS/JS files)
- Google Fonts via @import inside style tags
- All options include opt-nav (bottom-right) for dev navigation — remove before going live
- This file is the single source of truth

## Session Log
- **2026-03-14:** Project created, options 1–10 built
- **2026-03-14:** Options 11–15 built (video chaos, superseded)
- **2026-03-14:** Options 16–25 built (VideoManager pattern, superseded)
- **2026-03-14:** Options 26–45 built — 20 completely fresh layouts from scratch

## Git
- Repo: https://github.com/joskows-ctrl/jo-site
- Branch: main
