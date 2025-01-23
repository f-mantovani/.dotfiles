# Tokyo Twilight

> Before the neon Night comes the calm Twilight.

<img alt="banner" src="https://github.com/user-attachments/assets/13ab5642-4dd8-43ac-abb0-b11e48c3672d">

_Font: [Fira Code](https://github.com/tonsky/FiraCode), File icons: [Catppuccin Mocha](https://github.com/catppuccin/vscode-icons)._

## Minimal highlighting and deemphasized syntax

Tokyo Twilight only highlights 3 things: 

1. Definitions in <p style="color: #ffb37e; display: inline">orange.</p> 
2. Strings in <p style="color: #7ecaff; display: inline">blue.</p> 
3. Static constants in <p style="color: #7effb4; display: inline">green.</p> 

All other syntax is deemphasized to promote focus on content. This can be adjusted in settings.json if wanted:

```
"editor.tokenColorCustomizations": {
    "textMateRules": [
        {
            "name": "Punctuation",
            "scope": "punctuation",
            "settings": {
                "foreground": "#ebecf0"
            }
        }
    ]
}
```

## Supported languages

- Clojure
- ClojureScript
- JavaScript
- TypeScript (& TSX)
- Markdown
- HTML
- CSS

Pull requests for other languages are most welcome.

## Inspirations

- [Tokyo Night](https://github.com/tokyo-night/tokyo-night-vscode-theme), largely.
- [Nord](https://github.com/nordtheme/nord), for its blue color palette.
- [Poimandres](https://github.com/drcmda/poimandres-theme), for its frameless design.
- [Alabaster](https://github.com/tonsky/vscode-theme-alabaster), for its approach to highlighting. 

_Tokyo Tower photo by Marek Okon on Unsplash. Banner and icon by me._