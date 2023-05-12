;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package magit)

(use-package git-gutter
  :config
  (global-git-gutter-mode 1))

;;(use-package git-blamed)
;;(use-package git-modes)
;; (use-package git-timemachine)

(provide 'init-git)
