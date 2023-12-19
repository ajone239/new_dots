;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Austin Jones"
      user-mail-address "austin@polysign.io")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(custom-set-variables '(org-agenda-files (directory-files-recursively org-directory "\.org$")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;;###autoload
(defun open-pdf()
  (interactive)
  (shell-command
   (format "open %s.pdf"
           (car (split-string (file-name-nondirectory buffer-file-name) "\\.")))))

(map! :leader
      :desc "PDF for doc" "o d" #'open-pdf)

(map! :leader
      :desc "Neotree" "o n" #'neotree-toggle)

(map! :leader
      :desc "Go Back Definition" "g b" #'pop-tag-mark)

; START TABS CONFIG
;; Create a variable for our preferred tab width
(setq-default custom-tab-width 2)
(setq-default indent-tabs-mode nil)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
(setq-default evil-shift-width custom-tab-width)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#E5D7DB")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere
; END TABS CONFIG

;; Set up semantic DB
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)


(require 'compile)
(add-hook 'markdown-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (format "pandoc -o %s %s" ;
                         (replace-regexp-in-string "\.md$" ".pdf" (file-name-nondirectory buffer-file-name))
                         (file-name-nondirectory buffer-file-name)))))

(require 'compile)
(add-hook 'TeX-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (format "pdflatex %s" (file-name-nondirectory buffer-file-name)))))


(setq-default evil-escape-key-sequence "jj")
(setq-default evil-escape-delay 0.2)

(use-package rustic
  :ensure
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; fix rustfmt
  :custom
  (rustic-rustfmt-config-alist '((edition . "2018")))

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t))
