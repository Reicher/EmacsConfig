;; Först sudo apt install global
;; "make linux_gtags" för att bygga allt som krävs i weos
;; M-h for quick help (doesnt work)

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
