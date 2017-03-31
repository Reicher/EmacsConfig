;;;; TO RELOAD THIS FILE: Use command load-file (M-x load-file) return twice.

(load-file "~/.emacs.d/package_stuff.el")

(use-package auto-dim-other-buffers
  :ensure t
  :config (auto-dim-other-buffers-mode 1))

(use-package nyan-mode
  :ensure t
  :init (nyan-mode 1))

(use-package magit
  :ensure t
  :config (bind-key "C-x m" 'magit-status))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package git-gutter+
  :ensure t
  :config
  (global-git-gutter+-mode))

;; my god..
(use-package guru-mode
  :ensure t
  :config
  (guru-global-mode +1)
  (setq guru-warn-only t))

(use-package clang-format
  :ensure t)

(use-package projectile
  :ensure t
  :demand t)

(use-package ibuffer-vc
  :ensure t
  :demand t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org
  :ensure t)

;; Disable autosave and backups
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
