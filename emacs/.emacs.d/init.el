;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(setq default-directory "~/")

;; Update the load-path
(dolist (folder (directory-files (concat user-emacs-directory "lisp") t directory-files-no-dot-files-regexp))
  (add-to-list 'load-path folder))

(require 'init-fn)
(require 'init-system)
(require 'init-elpa)
(require 'init-builtin)
(require 'init-package)
(require 'init-dev)
(require 'init-ui)


;; load custom file at last
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
    (load custom-file))

(setq modus-themes-mode-line '(accented borderless padded))
(setq modus-themes-region '(accented))
(load-theme 'modus-vivendi t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name
	doom-modeline-enable-word-count 1
	doom-modeline-icon nil
	doom-modeline-bar-width 3)
  :custom ((doom-modeline-height 15)))


(provide 'init)
