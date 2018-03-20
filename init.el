;;;; TO RELOAD THIS FILE: Use command load-file (M-x load-file) return twice.
;;;; C-M-x för att ladda om ett helt kommando

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/package_stuff.el")

;; Nyan cat shows how far in the buffer you have scrolled.
(use-package nyan-mode
  :ensure t
  :init (nyan-mode t))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package magit
  :ensure t
  :config
  (bind-key "C-x m" 'magit-status)
  (bind-key "C-x l" 'magit-log-buffer-file)
  (add-hook 'magit-status-sections-hook 'magit-insert-submodules 'last))


(setq tramp-default-method "ssh")

(use-package elpy
  :ensure t
  :config
  (elpy-enable))

;; Adds a git overview in the "gutter" of a buffer
(use-package git-gutter+
  :ensure t
  :config
  (global-git-gutter+-mode))

;; Makes the focused buffer a little brighter than the rest
;; (use-package auto-dim-other-buffers
;;   :ensure t
;;   :config (auto-dim-other-buffers-mode 1))

;; Switch buffers easy
(bind-key* [C-tab] 'other-window)

;; Disable autosave and backups
(setq make-backup-files nil)
(setq auto-save-default nil)
(auto-save-mode 0)

;; Cleanup whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Changes C-x C-f to a supercool mode...
(ido-mode t)

;; Kill all buffers
(defun nuke-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))
(global-set-key (kbd "C-x K") 'nuke-all-buffers)

;; Remove top toolbar
(tool-bar-mode 0)

;; Disables exit emacs and minimize/suspend emacs commands
(global-set-key "\C-x\C-z" nil)
(global-set-key (kbd "C-x C-z") nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode magit which-key use-package projectile org-journal nyan-mode git-gutter+ ggtags fill-column-indicator elpy editorconfig counsel-gtags company-shell company-irony-c-headers company-irony company-flx company-c-headers color-theme clang-format auto-dim-other-buffers))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
