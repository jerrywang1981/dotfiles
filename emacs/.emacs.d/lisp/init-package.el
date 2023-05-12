;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:


(use-package counsel)
(use-package gnu-elpa-keyring-update)
(use-package diminish)
(use-package delight)
(use-package restart-emacs)

(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))

;(use-package vterm-toggle)
;(use-package multi-vterm)

(use-package exec-path-from-shell
  :defer nil
;;  :if (memq window-system '(mac ns x))
  :init (exec-path-from-shell-initialize))

(use-package hl-line
  :config
  (global-hl-line-mode))

;; Show the delimiters as rainbow color
(use-package rainbow-delimiters
  :init (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
(use-package highlight-parentheses
  :init (add-hook 'prog-mode-hook 'highlight-parentheses-mode))

;; (use-package avy)	
;; (global-set-key (kbd "M-g f") 'avy-goto-line)
;; (global-set-key (kbd "M-g w") 'avy-goto-word-1)
;; (global-set-key (kbd "C-'") 'avy-goto-char-2)


(use-package ivy
  :diminish
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
;;   ("C-c v" . 'ivy-push-view)
;;   ("C-c s" . 'ivy-switch-view)
;;   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring)
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))



(use-package emacs
  :config
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t))

(use-package which-key
  :init
  (which-key-mode))

(column-number-mode)

(provide 'init-package)
