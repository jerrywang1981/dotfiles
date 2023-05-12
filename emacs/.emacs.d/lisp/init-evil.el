;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
)

(evil-mode 1)


(setq undo-limit 8000000
      undo-strong-limit 8000000
      undo-outer-limit 8000000)

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :after evil
  )
(global-evil-surround-mode 1)

(use-package evil-matchit
  :ensure t
  :after evil
  :config
 (global-evil-matchit-mode 1))

(use-package evil-escape
  :ensure t
  :after evil
  :config
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.3)
  (setq evil-escape-excluded-major-modes '(dired-mode))
  )
(evil-escape-mode 1)

(use-package evil-commentary
  :after evil)
(evil-commentary-mode)

(provide 'init-evil)
