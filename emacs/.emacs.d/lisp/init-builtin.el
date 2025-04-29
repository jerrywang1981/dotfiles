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
  (setq save-place-forget-unreadable-files nil
    save-place-file "~/.saveplaces"
    )
  )

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

(use-package savehist
  :config
  (setq savehist-file "~/.savehist_history")
  (savehist-mode 1)
  )

(use-package recentf
  :config
  (setq recentf-save-file "~/.recentf")
  )

(use-package project
  :config
  (setq project-list-file "~/.projects")
  )

(provide 'init-builtin)
