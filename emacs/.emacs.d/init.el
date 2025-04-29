;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(setq default-directory "~/")
;; Update the load-path
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/")))

;; Settings for Emacs 28+
(when (and (fboundp 'native-comp-available-p)
	   (native-comp-available-p))
  (setq native-comp-async-report-warnings-errors nil
	comp-deferred-compilation t
	package-native-compile t)
  (add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache" user-emacs-directory)))



(require 'init-fn)
(require 'init-system)
(require 'init-elpa)
(require 'init-keys)
(require 'init-package)
(require 'init-org)
(require 'init-term)
(require 'init-dashboard)
(require 'init-evil)
(require 'init-ivy)
(require 'init-fzf)
(require 'init-git)
(require 'init-dev)
(require 'init-eglot)
;; (require 'init-lsp)
(require 'init-http)
(require 'init-builtin)
(require 'init-ui)
(require 'init-bindings)


;; load custom file at last
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
    (load custom-file))

(setq modus-themes-mode-line '(accented borderless padded))
(setq modus-themes-region '(accented))
(load-theme 'modus-vivendi t)

;; (use-package powerline
;;   :config
;;   (powerline-default-theme)
;;   )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq
    ;; doom-modeline-buffer-file-name-style 'file-name
    doom-modeline-buffer-file-name-style 'relative-from-project
    doom-modeline-enable-word-count 1
    doom-modeline-project-detection 'auto
    doom-modeline-indent-info nil
    doom-modeline-vcs-max-length 24
    doom-modeline-persp-name t
    doom-modeline-icon nil
    doom-modeline-gnus nil
    doom-modeline-irc nil
    doom-modeline-battery nil
    doom-modeline-time nil
    doom-modeline-bar-width 3)
  :custom ((doom-modeline-height 15)))


(provide 'init)
