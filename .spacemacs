;; Configuration layers
;; --------------------

(defun dotspacemacs/layers ()
  (setq-default

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the lastest
   ;; version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   dotspacemacs-delete-orphan-packages nil
   dotspacemacs-distribution 'spacemacs

   dotspacemacs-configuration-layers

   '(
     nixos
     neotree
     csv
     graphviz
     (go :variables
         go-tab-width 4
         godoc-at-point-function 'godoc-gogetdoc
         go-format-before-save t
       )
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-private-snippets-directory t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-complete-with-key-sequence-delay 0.1
                      :disabled-for org)
     ;; It slows down the navigation in the buffer
     ;; https://github.com/turnspike/spacemacs-spaceline
     ;; (spacemacs-spaceline :location local)
     colors
     (dash :variables
           helm-dash-browser-func 'eww)
     ;; elm

     ;; emacs-lisp
     javascript  ;; required for json support
     ;; eyebrowse
     (git :variables
          ;; to see only 2-panes in the diff-window instead of 3
          magit-ediff-dwim-show-on-hunks t
          ;; to see the diff by words not whole lines
          magit-diff-refine-hunk nil)
     github
     gtags
     ;; html
     markdown
     ;; nginx
     (org :variables
          org-startup-indented t
          org-agenda-files (quote ("~/Dropbox/org-mode/" "~/.org-jira/"))
          org-hide-emphasis-markers t
          ;; this is to open only the task in the follow mode in agenda (F)
          org-agenda-follow-indirect t
          org-capture-templates
          '(;; other entries
            ("j" "Journal entry" plain
             (file+datetree+prompt "~/Dropbox/org-mode/journal.org")
             "**** %?")
            ("i" "Interview entry" plain
             (file+datetree+prompt "~/Dropbox/org-mode/interviews.org")
             "**** TODO Interview %?        :interview:\nSCHEDULED: %t")
            ("t" "Journal todo" plain
             (file+datetree+prompt "~/Dropbox/org-mode/journal.org")
             "**** TODO %?\nSCHEDULED: %t")
            )

          org-cycle-separator-lines -2
          org-fontify-whole-heading-lines t
          org-blank-before-new-entry '(
                                       (heading . nil)
                                       (plain-list-item . nil))
          org-export-babel-evaluate nil
          org-src-preserve-indentation t
          org-todo-keywords (quote
                   ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d@/!)")
                    (sequence "WAITING(w@/!)" "REVIEW(r)"
                        "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MERGED(m)" "MEETING(g@/!)")))
          org-todo-keyword-faces (quote
                                  (
                                   ("TODO" :foreground "red" :width bold)
                                   ("NEXT" :foreground "blue" :width bold)
                                   ("DONE" :foreground "forest green" :width bold)
                                   ("WAITING" :foreground "orange" :width bold)
                                   ("REVIEW" :foreground "orange" :width bold)
                                   ("MEETING" :foreground "orange" :width bold)
                                   ("HOLD" :foreground "magenta" :width bold)
                                   ("CANCELLED" :foreground "forest gree" :width bold)
                                   ("MERGED" :foreground "forest green" :width bold)))
          org-log-done (quote time)
          org-log-into-drawer t
          org-log-state-notes-insert-after-drawers nil
          org-hide-emphasis-markers t
          org-enable-github-support t
          org-enable-bootstrap-support t
          org-enable-reveal-js-support t
          ;; Syntax highlighting in #+BEGIN_SRC blocks
          org-src-fontify-natively t
          ;; Don't prompt before running code in org
          org-confirm-babel-evaluate nil
          )
     ;; ocaml
     osx

     dap
     (python :variables
             python-fill-docstring-style 'pep-257-nn
             python-fill-column 79
             python-test-runner 'pytest
             )
     ;; ranger
     (semantic
      :variables semantic-stickyfunc-mode nil)
     ;; terraform
     (shell :variables
            shell-default-height 48
            shell-default-position 'bottom
            shell-default-term-shell "bash"
            ;; shell-default-shell 'eshell
            shell-default-shell 'multi-term
            multi-term-program "bash"
            )
     (syntax-checking :variables
                     syntax-checking-enable-by-default t)
     themes-megapack
     (theming :variables
              theming-headings-inherit-from-default 'all
              theming-headings-same-size 'all
              theming-headings-bold 'all)
     (spell-checking :variables
                     spell-checking-enable-auto-dictionary t
                     enable-flyspell-auto-completion t
                     spell-checking-enable-by-default nil
      )
     restclient
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      git-magit-status-fullscreen t)
     yaml)

   dotspacemacs-additional-packages `(
                                      centaur-tabs
                                      ;; to fix the editor issue when commiting
                                      git-commit

                                      paper-theme
                                      magit-todos
                                      plantuml-mode
                                      all-the-icons
                                      doom-themes

                                      flycheck-mypy
                                      protobuf-mode
                                      eval-sexp-fu
                                      virtualenvwrapper
                                      ob-restclient
                                      ;; allows to not block on org source-block
                                      ;; execution
                                      ob-async
                                      )
   dotspacemacs-excluded-packages `(
        importmagic
        org-plus-contrib
        evil-search-highlight-persist
        eval-sexp-fu
        info+
        smooth-scrolling
        rainbow-delimiters
        treemacs
        ;; not needed functionality
        pip-requirements
        pippel
        )
   ) ;; setq
  )

(defun dotspacemacs/init ()
  "Initialization function.
   This function is called at the very startup of Spacemacs initialization
   before layers configuration."

  (setq-default
   ;; exec-path-from-shell-arguments '("-l")
   dotspacemacs-elpa-https t
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
	 dotspacemacs-check-for-update nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-mode-line-theme 'vim-powerline
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-buffer-responsive t

   dotspacemacs-themes (if (display-graphic-p) `(default paper cyberpunk  smyx doom-one-light zenburn) `(default zenburn paper))

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t

   dotspacemacs-default-font '("IBM Plex Mono"
                               :weight normal
                               :width normal
                               :size 11
                               :powerline-scale 1.2)

   dotspacemacs-leader-key ","
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key "SPC"
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize t
   ;; dotspacemacs-helm-position 'right
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-smooth-scrolling t
   dotspacemacs-search-tools '("rg" "ag" "grep")

   dotspacemacs-large-file-size 32
   ;; dotspacemacs-line-numbers t
   dotspacemacs-folding-method 'evil  ;; origami
   ))

(defun dotspacemacs/user-init ()
  (setq-default
   ;; Increase space between the lines
   line-spacing 5
   ;; Miscellaneous
   require-final-newline t
   x-select-enable-clipboard t

   ;; Backups
   backup-directory-alist `((".*" . ,temporary-file-directory))
   auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   make-backup-files nil

   ;; Evil
   evil-shift-round nil
   evil-want-C-i-jump nil

   ;; Whitespace mode
   whitespace-style '(face tabs tab-mark newline-mark)
   whitespace-display-mappings
   '((newline-mark 10 [172 10])
     (tab-mark 9 [9655 9]))

   ;; Wait 0.5seconds before automatically highlitghting
   ahs-idle-interval 0.5

   ;; Avy
   avy-all-windows 'all-frames

   ;; Flycheck
   flycheck-check-syntax-automatically '(save mode-enabled)

   ))

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  (config-visuals)

  (add-to-list 'spacemacs-default-jump-handlers 'dumb-jump-go)


  ;; for any theme I wan to be able to see the borders of the windows.
  (set-frame-parameter (selected-frame) 'internal-border-width 15)

  (fset 'evil-visual-update-x-selection 'ignore)

  ;; -------------- font configuration
  (if (eq system-type 'darwin)
      ;; The emacs should be installed from
      ;; https://github.com/railwaycat/homebrew-emacsmacport
      (mac-auto-operator-composition-mode))

  ;; ui
  ;; https://news.ycombinator.com/item?id=17172524
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))

  ;; -------------- plantuml mode
  (add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))

  ;; org-plantuml-jar-path’ is not set

  ;; -------------- configure doom themes
  (require 'doom-themes)
  ;; Neotree
  (with-eval-after-load 'neotree
    (add-to-list 'neo-hidden-regexp-list "TAGS$")
    (add-to-list 'neo-hidden-regexp-list "__pycache__")
  )
  ;; auto-completion for python doesn't work
  ;; https://github.com/syl20bnr/spacemacs/issues/10638
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))
  ;; Enable custom neotree theme
  ;; (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (evil-leader/set-key "of" 'neotree-find)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config)

  (require 'helm-bookmark)
  (defun jao-toggle-selective-display ()
    (interactive)
    (set-selective-display (if selective-display nil 1)))

  (global-set-key [f3] 'jao-toggle-selective-display)
  (global-set-key [f4] 'sp/tox/activate-current-project-tox-env)

  (setq-default
   powerline-default-separator 'alternate
   guide-key/popup-window-position :right
   )

  (set-fill-column 100)
  (global-set-key (kbd "C-=") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out)
  (setq clojure-enable-fancify-symbols t)
  (setq flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list)

  ;; Miscellaneous
  (add-hook 'text-mode-hook 'auto-fill-mode)
  (add-hook 'makefile-mode-hook 'whitespace-mode)

  (add-hook 'python-mode-hook 'flycheck-mode)
  (add-hook 'python-mode-hook 'flyspell-prog-mode)
  (add-hook 'python-mode-hook 'auto-fill-mode)

  (advice-add 'pyenv-mode-set
              :after
              (lambda (_) (setenv "PYTHONPATH" (format "%s/src" (projectile-project-root))))
              )

  ;; Org-babel
  (require 'plantuml-mode)
  (setq org-plantuml-jar-path "/Users/volodymyr.vitvitskyi/bin/plantuml.1.2018.10.jar")

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (async . t)
     (awk . t)
     (dot . t)
     (emacs-lisp . t)
     (restclient . t)
     (gnuplot . t)
     (makefile . t)
     (ocaml . t)
     (org . t)
     (perl . t)
     (plantuml . t)
     (python . t)
     (shell . t)
     (sql . t)
     (sqlite . t)))

  (add-to-list
   'org-src-lang-modes '("plantuml" . plantuml))
  ;; Open only task sub-tree on org-agdenda-goto from agenda
  ;; https://emacs.stackexchange.com/questions/17797/how-to-narrow-to-subtree-in-org-agenda-follow-mode
  (advice-add 'org-agenda-goto :after
              (lambda (&rest args)
                (org-narrow-to-subtree)))

  ;; Disable smartparens highlighting
  (with-eval-after-load 'smartparens
    (show-smartparens-global-mode -1))

  ;; https://gist.github.com/ftrain/8443721
  ;; enable visual feedback on selections
  (setq transient-mark-mode t)
  ;; default to better frame titles
  (setq frame-title-format
        (concat  "%b - emacs@" (system-name)))
  ;; default to unified diffs
  (setq diff-switches "-u")

  ;; use the built-in emacs prompt for passphrase when using gpg
  (setf epa-pinentry-mode 'loopback)

  (require 'flycheck-mypy)
  (flycheck-add-next-checker 'python-flake8 'python-mypy t)
  (setq flycheck-python-mypy-args
        '("--strict-optional" "--ignore-missing-imports"))
  (dolist (f '("GPATH" "GTAGS" "GRTAGS" ".*"))
    (add-to-list 'helm-grep-ignored-files f))
  )

(defun config-visuals ()

  (spacemacs/toggle-highlight-current-line-globally-off)
  (add-hook 'semantic-mode-hook 'sp/fight-stickyfunc)
  (setq-default highlight-indent-guides-method 'character)
  (unless (display-graphic-p)
    (set-face-background 'default "unspecified-bg" (selected-frame)))

  )

;; copied from https://github.com/adamseyfarth/dotfiles/blob/70cd5f7d6961097926142af1e8c6c33b20eedfa2/spacemacs/.spacemacs#L344
(defun sp/fight-stickyfunc ()
  "Do whatever it takes to disable semantic-stickyfunc-mode"
  (with-eval-after-load 'semantic
    (setq-default semantic-default-submodes
                  (remove 'global-semantic-stickyfunc-mode
                          semantic-default-submodes))
    (spacemacs/toggle-semantic-stickyfunc-globally-off)))

(defun sp/path/parent-dir (dir)
  (file-name-directory (directory-file-name dir)))

(defun sp/tox/find-tox-dirs-in-project (project-root-dir)

  (defun -find-toxenv-bin-dirs (root)
    (projectile-files-via-ext-command
     root
     (format "find %s -type d -name 'bin' -path '*/.tox/*/bin' -print0" root)))

  (-map (lambda (file) (sp/path/parent-dir (sp/path/parent-dir file)))
        (-find-toxenv-bin-dirs project-root-dir)))

(defun sp/tox/activate-current-project-tox-env ()
  (interactive)
  (let* (
         (venv-dirs (sp/tox/find-tox-dirs-in-project (projectile-project-root)))
         (venv-dirs-length (length venv-dirs)))
    (progn
      (venv-set-location
       (if (> venv-dirs-length 1)
           (helm-comp-read "Choose tox directory to workon" venv-dirs)
         (if (= venv-dirs-length 0)
             (error "The project doesn't have created tox virtual environments.")
           (car venv-dirs))))
      (venv-workon)
      (add-to-list 'python-shell-extra-pythonpaths (projectile-project-root))
      (add-to-list 'python-shell-extra-pythonpaths (format "%s/src" (projectile-project-root)))
      )))

(defun sp/org-insert-clipboard-image (&optional file)
  (interactive "F")
  (shell-command (concat "pngpaste " file))
  (insert (concat "[[" file "]]"))
  (org-display-inline-images))


(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#242730" "#ff665c" "#7bc275" "#FCCE7B" "#51afef" "#C57BDB" "#5cEfFF" "#bbc2cf"])
 '(beacon-color "#d33682")
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#62686E")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote light))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f24" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f24" "#7bc275"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f24" "#484854"))
 '(magit-diff-use-overlays nil)
 '(magit-gitignore-arguments nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(objed-cursor-color "#ff665c")
 '(package-selected-packages
   (quote
    (centaur-tabs godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc flycheck-gometalinter flycheck-golangci-lint counsel-gtags company-go go-mode wsd-mode org-download kaolin-themes gruvbox-theme google-translate forge color-theme-sanityinc-tomorrow centered-cursor-mode apropospriate-theme ace-window counsel swiper ivy window-purpose helm hydra zenburn-theme zen-and-art-theme yasnippet-snippets yapfify yaml-mode xterm-color ws-butler writeroom-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights virtualenvwrapper vi-tilde-fringe uuidgen utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection stickyfunc-enhance srefactor sql-indent spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme solaire-mode soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restclient-helm restart-emacs rebecca-theme rainbow-mode rainbow-identifiers railscasts-theme racer pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode protobuf-mode professional-theme prettier-js popwin plantuml-mode planet-theme pippel pipenv pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode password-generator paradox paper-theme ox-twbs ox-reveal ox-gfm osx-trash osx-dictionary origami orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-bullets org-brain open-junk-file omtose-phellack-theme oldlace-theme ocp-indent occidental-theme obsidian-theme ob-restclient ob-http noctilux-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme merlin material-theme markdown-toc majapahit-theme magithub magit-todos magit-svn magit-gitflow madhat2r-theme lush-theme lorem-ipsum livid-mode live-py-mode link-hint light-soap-theme launchctl json-navigator json-mode js2-refactor js-doc jinja2-mode jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide importmagic impatient-mode imenu-list hungry-delete highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-gtags helm-gitignore helm-git-grep helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruber-darker-theme grandshell-theme gotham-theme golden-ratio gnuplot gitignore-templates github-search github-clone gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gist gh-md ggtags gandalf-theme fuzzy font-lock+ flyspell-popup flyspell-correct-helm flycheck-rust flycheck-pos-tip flycheck-mypy flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode editorconfig dumb-jump dracula-theme dotenv-mode doom-themes doom-modeline django-theme diminish diff-hl dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode counsel-projectile company-web company-tern company-statistics company-restclient company-ansible company-anaconda column-enforce-mode color-theme-sanityinc-solarized color-identifiers-mode clues-theme closql clean-aindent-mode cherry-blossom-theme cargo busybee-theme bubbleberry-theme browse-at-remote birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary anti-zenburn-theme ansible-doc ansible ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(pytest-cmd-flags "-vvv  -x -s --doctest-modules")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#242730")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (list
    (cons 20 "#7bc275")
    (cons 40 "#a6c677")
    (cons 60 "#d1ca79")
    (cons 80 "#FCCE7B")
    (cons 100 "#f4b96e")
    (cons 120 "#eda461")
    (cons 140 "#e69055")
    (cons 160 "#db8981")
    (cons 180 "#d082ae")
    (cons 200 "#C57BDB")
    (cons 220 "#d874b0")
    (cons 240 "#eb6d86")
    (cons 260 "#ff665c")
    (cons 280 "#d15e59")
    (cons 300 "#a35758")
    (cons 320 "#754f56")
    (cons 340 "#62686E")
    (cons 360 "#62686E")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-0-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-1-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-2-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-3-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-4-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-5-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-slide-title-face ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-5 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-6 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-document-title ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-5 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-6 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-7 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-8 ((t (:inherit default :height 1.0 :weight bold)))))
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum white-sand-theme which-key web-beautify volatile-highlights virtualenvwrapper vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance srefactor spaceline spacegray-theme soothe-theme solarized-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle shell-pop seti-theme reverse-theme reveal-in-osx-finder restclient-helm restart-emacs rebecca-theme rainbow-mode rainbow-identifiers railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme protobuf-mode professional-theme popwin plantuml-mode planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pbcopy paradox spinner paper-theme ox-twbs ox-reveal ox-gfm osx-trash osx-dictionary orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-restclient ob-http noctilux-theme nix-mode neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-todos pcre2el magit-gitflow magit-popup magit-gh-pulls madhat2r-theme lush-theme lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jinja2-mode jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-nixos-options helm-mode-manager helm-make helm-gtags helm-gitignore request helm-flx helm-descbinds helm-dash dash-docs helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme graphviz-dot-mode grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md ggtags gandalf-theme fuzzy flyspell-popup flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck-mypy flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit transient git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree espresso-theme eshell-z eshell-prompt-extras esh-help dumb-jump dracula-theme doom-themes django-theme diminish diff-hl dash-at-point darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme csv-mode company-tern dash-functional tern company-statistics company-restclient restclient know-your-http-well company-quickhelp pos-tip company-nixos-options nixos-options company-go go-mode company-ansible company-anaconda company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode coffee-mode clues-theme clean-aindent-mode cherry-blossom-theme centaur-tabs powerline busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary apropospriate-theme anti-zenburn-theme ansible-doc ansible anaconda-mode pythonic f dash s ample-zen-theme ample-theme all-the-icons memoize alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup soft-stone-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(font-latex-sectioning-0-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-1-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-2-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-3-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-4-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-5-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-slide-title-face ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(info-title-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-5 ((t (:inherit default :height 1.0 :weight bold))))
 '(markdown-header-face-6 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-document-title ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-1 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-2 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-3 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-4 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-5 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-6 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-7 ((t (:inherit default :height 1.0 :weight bold))))
 '(org-level-8 ((t (:inherit default :height 1.0 :weight bold)))))
