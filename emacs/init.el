(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)
(package-refresh-contents)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq truncate-lines t)
(setq truncate-partial-width-windows t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq scroll-conservatively 1)
(setq scroll-margin 10)
(setq next-screen-context-lines 5)
(setq scroll-preserve-screen-position t)
(setq windmove-wrap-around t)

;; install use-package if it does not exist
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(setq use-package-always-ensure t)
(require 'use-package)

;; language modes
(use-package go-mode)
(use-package rust-mode)
(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2))
(use-package markdown-mode)
(use-package dotenv-mode)
(use-package rspec-mode)

;; company
(use-package company
  :init
  (global-company-mode))
(use-package company-go)
(use-package company-php)

;; docker
(use-package dockerfile-mode)
(use-package docker-compose-mode)

;; package for Rust
(use-package cargo)

;; package for Ruby
(use-package ruby-end)
(use-package flymake-ruby)

;; package for JavaScript
(use-package typescript-mode)

;; developer support
(use-package magit)
(use-package editorconfig
  :init
  (editorconfig-mode 1))
(use-package rainbow-delimiters)
(use-package dumb-jump)
(use-package neotree
  :init
  (setq neo-smart-open t)
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq-default neo-show-hidden-files t))
(use-package yaml-mode)

(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(setq ruby-insert-encoding-magic-comment nil)

;; window moving
(windmove-default-keybindings)
(global-set-key (kbd "<ESC> <left>")  'windmove-left)
(global-set-key (kbd "<ESC> <down>")  'windmove-down)
(global-set-key (kbd "<ESC> <right>") 'windmove-right)
(global-set-key (kbd "<ESC> <up>")    'windmove-up)

;; customize faces
(set-face-foreground 'font-lock-string-face "color-202")
(set-face-foreground 'minibuffer-prompt "brightyellow")
(set-face-foreground 'neo-dir-link-face "color-39")
(set-face-foreground 'neo-file-link-face "cyan")
(set-face-foreground 'neo-header-face "color-196")
(set-face-foreground 'neo-root-dir-face "color-190")
(set-face-foreground 'font-lock-builtin-face "brightyellow")
(set-face-foreground 'font-lock-comment-face "color-123")
(set-face-foreground 'font-lock-function-name-face "brightcyan")
(set-face-foreground 'font-lock-string-face "brightred")
(set-face-foreground 'font-lock-type-face "brightgreen")
(set-face-foreground 'font-lock-variable-name-face "color-142")
(set-face-foreground 'minibuffer-prompt "brightcyan")
(set-face-background 'highlight "brightblack")
(set-face-foreground 'link "color-51")
(set-face-underline 'link t)
(set-face-foreground 'magit-branch-local "color-250")
(set-face-foreground 'magit-refname "color-250")
(set-face-foreground 'shadow "color-255")
(set-face-foreground 'web-mode-html-tag-bracket-face "brightwhite")
(set-face-foreground 'web-mode-html-tag-face "brightcyan")
(set-face-foreground 'web-mode-inlay-face "color-27")
