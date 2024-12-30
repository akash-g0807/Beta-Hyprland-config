;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)
(package! flycheck-aspell)
;; (package! calfw)
;; (package! calfw-org)
(package! dashboard)
(package! dired-open)
(package! dired-subtree)
(package! dirvish)
(package! ednc)
(package! emojify)
(package! evil-tutor)
(package! ivy-posframe)
(package! mw-thesaurus)
(package! org-auto-tangle)
(package! org-web-tools)
(package! ox-gemini)
(package! peep-dired)
(package! password-store)
(package! rainbow-mode)
(package! resize-window)
;;(package! tldr)
(package! wc-mode)
;;(package! beacon)
;;(package! clippy)
(package! minimap)
(package! olivetti)
(package! company)
(package! ccls)
(package! platformio-mode)
(package! org-wild-notifier)
(package! vterm-toggle)
(package! auctex-latexmk)
(package! auto-dictionary)
(package! json-mode)
;;(package! ob-async)
;;(package! async)
(package! json)
(package! seq)
(package! dap-mode)
(package! exec-path-from-shell)
(package! git-gutter)
(package! git-gutter-fringe)
(package! lsp-latex)
;(package! elcord)
(package! elcord :recipe (:host github :repo "Thingybob8055/elcord"))`
;(package! elcord :disable t)
(package! cl-lib)
(package! visual-fill-column)
(unpin! org-roam)
;;(package! org-roam-ui :recipe (:host github :repo "jgru/org-roam-ui" :branch "add-export-capability") :disable t)
(package! org-roam-ui :recipe (:host github :repo "uncomfyhalomacro/org-roam-ui" :branch "feature/add-export-functionality"))
(package! fast-scroll)
(package! copilot
  :recipe (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))
(package! format-all)
(package! treesit-auto)
(package! exec-path-from-shell)
(package! elpy)
(package! org-html-themify :recipe (:host github :repo "DogLooksGood/org-html-themify" :files ("*.el" "*.js" "*.css")))
(package! ein)
(package! mixed-pitch)
