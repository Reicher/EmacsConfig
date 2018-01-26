;; Först sudo apt install global
;; "make linux_gtags" för att bygga allt som krävs i weos
;; M-h for quick help

(use-package ggtags
  :demand t
  :bind (:map ggtags-mode-map
              ("C-c g s" . ggtags-find-other-symbol)
              ("C-c g h" . ggtags-view-tag-history)
              ("C-c g r" . ggtags-find-reference)
              ("C-c g f" . ggtags-find-file)
              ("C-c g c" . ggtags-create-tags)
              ("C-c g u" . ggtags-update-tags)
              ("M-," . pop-tag-mark))
  :config
  (defun ggtags-enable-in-my-modes ()
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
      (ggtags-mode 1)))
  (add-hook 'c-mode-common-hook 'ggtags-enable-in-my-modes))

(use-package counsel-gtags
  :demand t
  :bind (:map ggtags-mode-map
              ("M-t" . counsel-gtags-find-definition)
              ("M-r" . counsel-gtags-find-reference)
              ("M-s" . counsel-gtags-find-symbol)
              ("M-," . counsel-gtags-go-backward)
              ("M-." . counsel-gtags-dwim))
  :config
  (defun counsel-gtags-mode-in-my-modes ()
    (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
      (counsel-gtags-mode 1)))

  (add-hook 'c-mode-common-hook 'counsel-gtags-mode-in-my-modes))

(use-package company
  :demand t
  :bind (
         ("M-TAB" . company-complete-common-or-cycle)
         ("M-<tab>" . company-complete-common-or-cycle)
         :map company-active-map
         ("M-k" . company-select-next)
         ("M-i" . company-select-previous)
         ("M-K" . company-next-page)
         ("M-I" . company-previous-page)
         ("C-j" . company-complete-common)
         ("C-M-j" . company-complete-selection))
  ;; :diminish company-mode
  :commands (company-mode global-company-mode)
  :init
  (defvar-local company-fci-mode-on-p nil)
  :config
  (defun company-turn-off-fci (&rest ignore)
    (when (boundp 'fci-mode)
      (setq company-fci-mode-on-p fci-mode)
      (when fci-mode (fci-mode -1))))

  (defun company-maybe-turn-on-fci (&rest ignore)
    (when company-fci-mode-on-p (fci-mode 1)))

  (setf company-show-numbers t)
  (setf company-minimum-prefix-length 0)
  (setf company-idle-delay 0.1)
  (setf company-global-modes '(not gud-mode))

  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'company-completion-started-hook 'company-turn-off-fci)
  (add-hook 'company-completion-finished-hook 'company-maybe-turn-on-fci)
  (add-hook 'company-completion-cancelled-hook 'company-maybe-turn-on-fci))

(use-package company-c-headers
  :demand t
  :config
  (add-to-list 'company-backends 'company-c-headers))

(use-package company-flx
  :config (with-eval-after-load 'company
            (company-flx-mode)))

(use-package company-irony
  :demand t
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends 'company-irony)))

(use-package company-irony-c-headers
  :config
  (add-to-list
   'company-backends '(company-irony-c-headers company-irony)))

(use-package company-quickhelp
  :bind (:map company-active-map
              ("M-h" . company-quickhelp-manual-begin))
  :config
  (progn
    (setf company-quickhelp-delay nil)
    (company-quickhelp-mode 1)))

(use-package company-shell
  :config
  (add-to-list 'company-backends 'company-shell)
  (add-hook 'shell-mode-hook
            (lambda () (setf-local company-backends
                              '((company-shell company-files))))))
