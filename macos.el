;;; macos.el -*- lexical-binding: t; -*-

;; Cursor
(setq-default cursor-type 'box)
(blink-cursor-mode -1)

;; Font config
(setq doom-font (font-spec :family "Iosevka Fixed Curly Slab" :size 16)
      doom-big-font (font-spec :family "Iosevka Fixed Curly Slab" :size 22 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Lato")
      ;; doom-unicode-font (font-spec :family "JuliaMono")
      doom-serif-font (font-spec :family "Iosevka Fixed Curly Slab" :weight 'light))

;; Browser Edge
(setq browse-url-browser-function 'browse-url-chrome)
(setq browse-url-chrome-program "/Applications/Microsoft Edge.app/Contents/MacOS/Microsoft Edge")

;; Eshell rm file to trash
(setq trash-directory "~/.Trash")
(defun system-move-file-to-trash (file)
  (cl-assert (executable-find "trash") nil "'trash' must be installed. Needs \"brew install trash\"")
  (call-process "trash" nil 0 nil "-F"  file))

;; Dwim shell commands
(require 'dwim-shell-commands)

;; Doom startup faster
(when (eq system-type 'darwin) (customize-set-variable 'native-comp-driver-options '("-Wl,-w")))
