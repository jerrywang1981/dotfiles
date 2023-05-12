;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package vterm
  :commands vterm
  :config
  (setq vterm-max-scrollback 10000))


;(use-package vterm-toggle)
(use-package multi-vterm
  :bind
  ("C-c t t" . multi-vterm-dedicated-toggle)
  ("C-c t c" . multi-vterm)
  ("C-c t n" . multi-vterm-next)
  ("C-c t p" . multi-vterm-prev)
  )

(provide 'init-term)
