;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(setq inhibit-startup-screen t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)


(setq auto-save-default nil	   ; disable auto save
      auto-window-vscroll nil
      delete-by-moving-to-trash t  ; disable delete directly
      fast-but-imprecise-scrolling t
      frame-title-format "%b"
      help-window-select t
      inhibit-default-init t
      inhibit-compacting-font-caches t
      initial-major-mode 'fundamental-mode
      make-backup-files nil             ; disable backup file
      ;; mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse t
      next-line-add-newlines nil
      read-process-output-max (* 64 1024)
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position t
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      visible-bell nil)


(provide 'init-system)
