;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:


(use-package gnu-elpa-keyring-update)
;; (use-package diminish)
(use-package delight)
(use-package restart-emacs)

(use-package exec-path-from-shell
  :defer nil
  :init (exec-path-from-shell-initialize))

(use-package all-the-icons
  :when (display-graphic-p))

(use-package hl-line
  :config
  (global-hl-line-mode))

;; Show the delimiters as rainbow color
(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package highlight-parentheses
  :init (add-hook 'prog-mode-hook 'highlight-parentheses-mode))


;; (use-package emacs
;;   :config
;;   (setq display-line-numbers-type 'relative)
;;   (global-display-line-numbers-mode t))

(use-package format-all
  :diminish
  :hook (prog-mode . format-all-ensure-formatter)
  ;; :bind ("C-c f" . #'format-all-buffer)
  )

(use-package which-key
  :init
  (which-key-mode))

(column-number-mode)

(use-package iedit)

(provide 'init-package)
