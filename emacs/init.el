(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; set variables
(setq package-enable-at-startup nil)
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
(setq ruby-insert-encoding-magic-comment nil)
(setq custom-file "~/.emacs.d/custom.el")
(condition-case nil
    (load custom-file)
  (error nil))

(straight-use-package 'use-package)

;; lsp
;; (use-package eglot
;;   :config
;;   (define-key eglot-mode-map (kbd "M-[") 'xref-find-definitions)
;;   (define-key eglot-mode-map (kbd "M-]") 'pop-tag-mark)
;;   (add-to-list 'eglot-server-programs
;;                '(ruby-mode . ("localhost:7658"))))
;;   (add-hook 'ruby-mode-hook #'eglot-ensure))

;; language packages
(use-package markdown-mode
  :straight t)
(use-package dotenv-mode
  :straight t)

;; company
(use-package company
  :init
  (global-company-mode)
  :straight t)
(use-package company-web
  :straight t)

;; docker
(use-package dockerfile-mode
  :straight t)
(use-package docker-compose-mode
  :straight t)

;; package for Ruby
(use-package ruby-end
  :straight t)

;; package for Rails
(use-package slim-mode
  :straight t)
(use-package rubocop
  :straight t)
(use-package rubocopfmt
  :straight t)

;; package for Go
(use-package go-mode
  :hook ((go-mode . (lambda ()
                      (setq indent-tabs-mode nil))))
  :straight t)
(use-package company-go
  :straight t)

;; package for Rust
(use-package rust-mode
  :straight t)
(use-package cargo
  :straight t)

;; package for frontend
(use-package web-mode
  :config
  (setq web-mode-markup-indent-offset 2)
  :init
  (add-to-list 'auto-mode-alist '("\\.slim$'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb$'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx$'" . web-mode))
  :straight t)
(use-package scss-mode
  :straight t)

;; developer support
(use-package magit
  :straight t)
(use-package editorconfig
  :init
  (editorconfig-mode 1)
  :straight t)
(use-package rainbow-delimiters
  :straight t)
(use-package dumb-jump
  :straight t)
(use-package neotree
  :config
  (setq neo-smart-open t)
  (setq-default neo-show-hidden-files t)
  :straight t)
(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :ensure t)

;; window moving
(windmove-default-keybindings)
(global-set-key (kbd "<ESC> <left>")  'windmove-left)
(global-set-key (kbd "S-<left>") 'windmove-left)
(global-set-key (kbd "<ESC> <down>")  'windmove-down)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "<ESC> <right>") 'windmove-right)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "<ESC> <up>")    'windmove-up)
(global-set-key (kbd "S-<up>") 'windmove-up)

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
