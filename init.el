;;;; TO RELOAD THIS FILE: Use command load-file (M-x load-file) return twice.
;;;; C-M-x för att ladda om ett helt kommando

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/package_stuff.el")


;; solarized-emacs - Solarized colorscheme for Emacs
;; (load-theme 'sanityinc-solarized-light)

(eval-after-load 'company-etags '(progn (add-to-list 'company-etags-modes 'web-mode)))
(setq company-etags-everywhere '(php-mode html-mode web-mode nxml-mode))

;; Nyan cat wants to show you how far in the buffer you have scrolled.
(use-package nyan-mode
  :ensure t
  :init (nyan-mode t))

(use-package magit
  :ensure t
  :config
  (bind-key "C-x m" 'magit-status)
  (bind-key "C-x l" 'magit-log-buffer-file))

(setq tramp-default-method "ssh")

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package crux
  :ensure t)

;; For python IDE stuffz
(use-package elpy
  :ensure t
  :config
  (elpy-enable))

;; Line-width line
(use-package fill-column-indicator
  :ensure t
  :config
  (add-hook'prog-mode-hook
   (lambda ()
     (fci-mode 1))))

;; Adds a git overview in the "gutter" of a buffer
(use-package git-gutter+
  :ensure t
  :config
  (global-git-gutter+-mode))

;; Punishes you for not using emacs bindings..
;; (use-package guru-mode
;;   :ensure t
;;   :config
;;   (guru-global-mode +1)
;;   (setq guru-warn-only t))

;; Format stuff in clang-format.
;; (use-package clang-format
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "C-c i") 'clang-format-region)
;;   (global-set-key (kbd "C-c u") 'clang-format-buffer))

(use-package projectile
  :ensure t
  :config (projectile-mode))

;; Brings up a view of commands when you made half a command...
(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'")

(use-package org
  :ensure t
  :config
  (use-package org-journal
    :ensure t))

;; Makes the focused buffer a little brighter than the rest
(use-package auto-dim-other-buffers
  :ensure t
  :config (auto-dim-other-buffers-mode 1))

;; Switch buffers easy
(bind-key* [C-tab] 'other-window)

;; Matching () {}
(show-paren-mode t)

;; Disable autosave and backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(auto-save-mode 0)

;; Cleanup whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ;; Counsel
;; (use-package counsel-projectile
;;      :demand t
;;      :config
;;      (counsel-projectile-on))

;; ;; Counsel-ag
;; (use-package counsel-ag
;;      :demand t)


;; Changes C-x C-f to a supercool mode...
(ido-mode t)

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))

;; Kill all buffers
(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))
(global-set-key (kbd "C-x K") 'nuke-all-buffers)

;;** Disable autosave and backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(auto-save-mode 0)

;; Save all buffers and stuff when exiting emacs, seccond line to remove
;; the really anoying pid-warning at startup
;; (desktop-save-mode 1)
;; (setq desktop-base-lock-name
;;       (convert-standard-filename (format ".emacs.desktop.lock-%d" (emacs-pid))))

;; Remove top toolbar
(tool-bar-mode 0)

;; Disables exit emacs and minimize/suspend emacs commands
(global-set-key "\C-x\C-z" nil)
(global-set-key (kbd "C-x C-z") nil)


(global-unset-key (kbd "C-x C-c"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#657b83" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#002b36"))
 '(beacon-color "#d33682")
 '(custom-enabled-themes (quote (solarized-gruvbox-dark)))
 '(custom-safe-themes
   (quote
    ("830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(fci-rule-color "#eee8d5")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(magit-commit-arguments (quote ("--signoff")))
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-solarized sanityinc-solarized-light molokai-theme lua-mode markdown-mode editorconfig ggtags which-key use-package solarized-theme psvn org-journal org nyan-mode neotree markdown-preview-eww magit latex-preview-pane jedi-core ibuffer-vc ibuffer-projectile guru-mode git-gutter+ fill-column-indicator elpy color-theme-solarized clang-format auto-dim-other-buffers auto-complete)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#cb4b16")
     (60 . "#b58900")
     (80 . "#859900")
     (100 . "#2aa198")
     (120 . "#268bd2")
     (140 . "#d33682")
     (160 . "#6c71c4")
     (180 . "#dc322f")
     (200 . "#cb4b16")
     (220 . "#b58900")
     (240 . "#859900")
     (260 . "#2aa198")
     (280 . "#268bd2")
     (300 . "#d33682")
     (320 . "#6c71c4")
     (340 . "#dc322f")
     (360 . "#cb4b16"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
