;;;; Setup so we can use package management system and use-package(require 'package)
(progn  (setq package-archives nil)
	(add-to-list 'package-archives
		     '("melpa" . "https://melpa.org/packages/"))
	(add-to-list 'package-archives
		     '("org" . "http://orgmode.org/elpa/")))
(package-initialize)

;; If never connected to repositories before, download package descriptions so
;;`use-package' can trigger installation of missing packages.
(unless package-archive-contents
  (message "Refreshing ELPA package archives...")
  (package-refresh-contents))

;; ...but before everything, make sure `use-package' is installed.
(unless (package-installed-p 'use-package)
  (message "`use-package' not found. Installing...")
  (package-install 'use-package))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(require 'use-package)
