;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Start Doom fullscreen
(setq initial-frame-alist '((top . 0) (left . 0) (width . 115) (height . 35)))

;; Set my-projectile-project-name to projectile-project-name,
;; so that later I can also set projectile project name when in *Messages* buffer etc
(defun my-projectile-switch-project-action ()
  (set-frame-parameter nil 'my-projectile-project-name projectile-project-name)
  (projectile-run-eshell)
  (projectile-find-file))
(setq projectile-switch-project-action 'my-projectile-switch-project-action)
(setq frame-title-format
    '(""
      "%b"
      (:eval
       (let ((project-name (projectile-project-name)))
           (if (not (string= "-" project-name))
             (format " ● %s" project-name)
             (format " ● %s" (frame-parameter nil 'my-projectile-project-name)))))))

;; Font config
;; (set-face-attribute 'default nil :height 140)

;; Disable exit confirmation
;; (setq confirm-kill-emacs nil)
;; When at the beginning of the line, make Ctrl-K remove the whole line, instead of just emptying it
(setq kill-whole-line t)
;; Enable line numbers
(setq display-line-numbers-type 'relative)
;; Highlight the current line
(setq global-hl-line-mode t)

;; Window startup 115x35
(setq initial-frame-alist '((top . 0) (left . 0) (width . 115) (height . 35)))

;; Enable showing a word count in the modeline.
(setq doom-modeline-enable-word-count t)

;; Make which-key popup faster
;; (setq which-key-idle-delay 0.1 ;; Default is 1.0
;;       which-key-idle-secondary-delay 0.05) ;; Default is nil

;; Mode line customization
(after! doom-modeline
  (setq doom-modeline-bar-width 3
        doom-modeline-mu4e t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-file-name-style 'truncate-upto-project))

;; Set transparency
;; (set-frame-parameter (selected-frame) 'alpha '(97 100))
;; (add-to-list 'default-frame-alist '(alpha 97 100))

;;; Info
(setq user-full-name "Hai Ho"
      user-mail-address "hthntts@yahoo.com"
      +doom-dashboard-banner-padding '(0 . 2)
      pixel-scroll-precision-mode t)

;;; Directory
(if (and (string-match-p "Windows" (getenv "PATH")) (not IS-WINDOWS))
    (setq drive-directory "/mnt/c/Users/haiht/Sync/")
  (setq drive-directory "~/"))

(setq org-directory (concat drive-directory "Documents/Notes/"))

;;; Projectile
(setq projectile-project-search-path
      '( "~/ghq/github.com/hthntts/"
         "~/OneDrive/")
      projectile-sort-order 'recentf)

;;; Engine
(engine-mode t)
(engine/set-keymap-prefix (kbd "C-c s"))
(defengine duckduckgo
  "https://duckduckgo.com/?q=%s"
  :keybinding "d")
(defengine github
  "https://github.com/search?ref=simplesearch&q=%s"
  :keybinding "h")
(defengine npm
  "https://www.npmjs.com/search?q=%s"
  :keybinding "n")
(defengine crates
  "https://crates.io/search?q=%s"
  :keybinding "c")
(defengine localhost
  "http://localhost:%s"
  :keybinding "l")
(defengine translate
  "https://translate.google.com/?sl=en&tl=vi&text=%s&op=translate"
  :keybinding "t")
(defengine youtube
  "http://www.youtube.com/results?aq=f&oq=&search_query=%s"
  :keybinding "y")
(defengine google
  "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s"
  :keybinding "g")

;;; Python
(defun autoload-venv()
  (cond
    ((string= (projectile-project-name) "py")
      (pyvenv-activate "~/.venv/python"))
    ((string= (projectile-project-name) "all")
      (pyvenv-activate "~/.venv/all"))))
(add-hook 'projectile-after-switch-project-hook #'autoload-venv)

;;; Enable lsp over Tramp
(after! tramp
  (when (require 'lsp-mode nil t)
    ;; (require 'lsp-pyright)
    (setq lsp-enable-snippet nil
          lsp-log-io nil
          ;; To bypass the "lsp--document-highlight fails if
          ;; textDocument/documentHighlight is not supported" error
          lsp-enable-symbol-highlighting nil)
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-tramp-connection "pyls")
      :major-modes '(python-mode)
      :remote? t
      :server-id 'pyls-remote))))

;;; Emulating vi's % key
(after! smartparens
  (defun zz/goto-match-paren (arg)
    "Go to the matching paren/bracket, otherwise (or if ARG is not
    nil) insert %.  vi style of % jumping to matching brace."
    (interactive "p")
    (if (not (memq last-command '(set-mark
                                  cua-set-mark
                                  zz/goto-match-paren
                                  down-list
                                  up-list
                                  end-of-defun
                                  beginning-of-defun
                                  backward-sexp
                                  forward-sexp
                                  backward-up-list
                                  forward-paragraph
                                  backward-paragraph
                                  end-of-buffer
                                  beginning-of-buffer
                                  backward-word
                                  forward-word
                                  mwheel-scroll
                                  backward-word
                                  forward-word
                                  mouse-start-secondary
                                  mouse-yank-secondary
                                  mouse-secondary-save-then-kill
                                  move-end-of-line
                                  move-beginning-of-line
                                  backward-char
                                  forward-char
                                  scroll-up
                                  scroll-down
                                  scroll-left
                                  scroll-right
                                  mouse-set-point
                                  next-buffer
                                  previous-buffer
                                  previous-line
                                  next-line
                                  back-to-indentation
                                  doom/backward-to-bol-or-indent
                                  doom/forward-to-last-non-comment-or-eol
                                  )))
        (self-insert-command (or arg 1))
      (cond ((looking-at "\\s\(") (sp-forward-sexp) (backward-char 1))
            ((looking-at "\\s\)") (forward-char 1) (sp-backward-sexp))
            (t (self-insert-command (or arg 1))))))
  (map! "%" 'zz/goto-match-paren))

;;; Org
(after! org-clock
  (setq org-clock-persist t)
  (org-clock-persistence-insinuate))

(after! org-download
  (setq org-download-method 'directory
        org-download-timestamp "%Y%m%d-%H%M%S_"
        org-download-image-dir (concat "images/"  (format-time-string "%Y") "/")
        org-download-heading-lvl 1))

(after! org
  (setq org-log-done 'note
        org-log-into-drawer 't))

(use-package! org-superstar
  :hook
  (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("" "" "" "" "" "" "" "" "" "")))

;; Org agenda styling
(setq org-agenda-block-separator ?─
      org-agenda-time-grid
      '((daily today require-timed)
        (800 1000 1200 1400 1600 1800 2000)
        " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
      org-agenda-current-time-string
      "⭠ now ─────────────────────────────────────────────────")

;;; Org reveal
(after! org
  (load-library "ox-reveal")
  (global-set-key [(f12)] 'org-reveal-export-to-html-and-browse)
  (reveal-mode 1)
  (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js"))

(defun zz/add-file-keybinding (key file &optional desc)
  (let ((key key)
        (file file)
        (desc desc))
    (map! :desc (or desc file)
          key
          (lambda () (interactive) (find-file file)))))

;;; Org tux
(defun tux/org-convert-keyword-case-to-lower ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (let ((count 0)
          (case-fold-search nil))
      (while (re-search-forward "^[ \t]*#\\+[A-Z_]+" nil t)
        (unless (s-matches-p "RESULTS" (match-string 0))
          (replace-match (downcase (match-string 0)) t)
          (setq count (1+ count))))
      (message "Replaced %d occurances" count))))

;;; Map
(map! "M-g o" #'counsel-outline)

;;; Terminal vterm
(after! vterm
  ;; Use default system shell
  (setq-default vterm-shell (getenv "SHELL"))
  ;; Maximum scrollback to the max
  (setq vterm-max-scrollback 100000)
  ;; Make vterm as snappy as it can be
  (setq vterm-timer-delay nil)
  ;; Use bash as default shell in remote servers.
  (pushnew! vterm-tramp-shells
            '("ssh" "/bin/bash")
            '("scp" "/bin/bash")))
;; Make urls clickable in vterm modes
(add-hook! vterm-mode #'goto-address-mode)

;;; Cursor
(beacon-mode 1)

(when IS-LINUX
  (load! "linux.el")
)
(when IS-MAC
  (load! "macos.el")
)

(load-file "~/Sync/Personal/config.el")
