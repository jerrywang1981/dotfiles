;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:


(use-package general
  :init
  (setq general-override-states '(insert
                                  emacs
                                  hybrid
                                  normal
                                  visual
                                  motion
                                  operator
                                  replace))
  :config
  (general-evil-setup t)
  (general-create-definer my-ctrl-c
    :prefix "C-c")
  ;; (general-create-definer my-space
  ;;   :prefix "SPC")
  (general-create-definer my-comma
    :prefix ",")
  )

(use-package hydra
  :after general)


(provide 'init-keys)
