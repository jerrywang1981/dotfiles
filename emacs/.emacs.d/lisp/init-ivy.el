;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package counsel
  :diminish
  :hook (after-init . counsel-mode)
  )

(use-package wgrep)

(use-package ivy
  :diminish
  :demand t
  :hook (after-init . ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-more-chars-alist '(
                                (counsel-grep . 2)
                                (counsel-git-grep . 2)
                                (counsel-rg . 2)
                                (counsel-search . 2)
                                (t . 2)
                                ))
  :bind
  (("C-s" . 'swiper)
    ("C-c C-r" . 'ivy-resume)
    ("C-c p f" . 'counsel-git)
    ("C-c p g" . 'counsel-git-grep)
    ("C-c p h" . 'counsel-recentf)
   ;; ("C-x b" . 'ivy-switch-buffer)
;;   ("C-c v" . 'ivy-push-view)
;;   ("C-c s" . 'ivy-switch-view)
;;   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring)
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

;; (ivy-mode 1)
;; (counsel-mode 1)

(use-package ivy-rich
  :after ivy
  :demand t
  :hook (after-init . ivy-rich-mode)
  :custom
  (ivy-format-function #'ivy-format-function-line)
  )


(provide 'init-ivy)
