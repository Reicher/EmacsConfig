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
  :config (bind-key "C-x m" 'magit-status)
  (add-hook 'magit-status-sections-hook 'magit-insert-submodules 'last))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

(use-package fill-column-indicator
  :ensure t
  :config (add-hook 'prog-mode-hook (lambda ()
    (fci-mode 1)
  )))

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
  :config (projectile-mode))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package org
  :ensure t
  :config
  (use-package org-journal
    :ensure t))

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
  (load-theme 'solarized-dark t))

;; Set .my files in snmp (v2) mode right away
(add-to-list 'auto-mode-alist '("\\.my\\'" . snmpv2-mode))

;;** Disable autosave and backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(auto-save-mode 0)

;; Save all buffers and stuff when exiting emacs
(desktop-save-mode 1)

;; Remove top toolbar
(tool-bar-mode 0)

(custom-set-variables
 '(magit-commit-arguments (quote ("--signoff"))))
(custom-set-faces)

;; Disables exit emacs and minimize/suspend emacs commands
(global-set-key "\C-x\C-z" nil)
(global-set-key (kbd "C-x C-z") nil)
