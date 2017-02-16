;;;; Setup so we can use package management system and use-package(require 'package)
(progn  (setq package-archives nil)
	(add-to-list 'package-archives
		     '("melpa" . "https://melpa.org/packages/"))
	(add-to-list 'package-archives
		     '("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;;; Prevent Emacs from automatically load packages on startup
;;; use-package takes care of package loading
(setq package-enable-at-startup nil)

;; If never connected to repositories before, download package descriptions so
;;`use-package' can trigger installation of missing packages.
(unless package-archive-contents
  (message "Refreshing ELPA package archives...")
  (package-refresh-contents))

;; ...but before everything, make sure `use-package' is installed.
(unless (package-installed-p 'use-package)
  (message "`use-package' not found. Installing...")
  (package-install 'use-package))

(require 'use-package)

(use-package psvn
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-smart-open t))

(use-package nyan-mode
  :ensure t
  :init (nyan-mode 1))

(use-package latex-preview-pane
  :ensure t
  :config (latex-preview-pane-enable))

(use-package magit
  :ensure t)

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package git-gutter+
  :ensure t
  :config
  (global-git-gutter+-mode))

;;** Disable autosave and backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(auto-save-mode 0)

;; Cleanup whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set python indent to 4
(add-hook 'python-mode-hook
      (lambda ()
        ;;(setq indent-tabs-mode t)
	(setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))

(use-package color-theme
  :ensure t)

(use-package solarized-theme
  :ensure t
  :init
  (load-theme 'solarized t))

;;** Disable autosave and backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(auto-save-mode 0)

;; Remove top toolbar
(tool-bar-mode 0)

;; (global-linum-mode t) ;; enable line numbers globally
(global-set-key (kbd "C-x C-o") 'ff-find-other-file)
