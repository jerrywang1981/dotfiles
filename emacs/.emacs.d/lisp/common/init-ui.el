;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package ace-window
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)))

(set-face-attribute 'default nil
		    :font "IBM Plex Mono"
		    :height 120)
		    

(provide 'init-ui)
