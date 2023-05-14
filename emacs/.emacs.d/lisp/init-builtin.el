;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(defalias 'yes-or-no-p 'y-or-n-p)
;; Abbrev
(setq-default abbrev-mode t)

(add-hook 'after-init-hook #'global-hl-line-mode)

(setq-default fill-column 80) ;; M-x set-fill-column RET
(add-hook 'after-init-hook 'global-display-fill-column-indicator-mode)

(use-package saveplace
  :hook (after-init . save-place-mode)
  :config
  (setq save-place-forget-unreadable-files nil)
  )

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

(provide 'init-builtin)
