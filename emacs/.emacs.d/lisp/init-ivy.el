;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package counsel)

(use-package ivy
  :diminish
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
    ("C-c C-r" . 'ivy-resume)
    ("C-c p f" . 'counsel-git)
    ("C-c p g" . 'counsel-git-grep)
   ;; ("C-x b" . 'ivy-switch-buffer)
;;   ("C-c v" . 'ivy-push-view)
;;   ("C-c s" . 'ivy-switch-view)
;;   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring)
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

(ivy-mode 1)
(counsel-mode 1)

(provide 'init-ivy)
