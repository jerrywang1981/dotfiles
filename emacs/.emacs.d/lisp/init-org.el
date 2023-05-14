;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:


(defun jw/org-mode-setup()
  (org-indent-mode)
  (variable-pitch-mode 1)
  ;; (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  )

(use-package org
  :hook (org-mode . jw/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"
        org-directory "~/org"
        org-agenda-files '("task.org"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  ;; :custom
  ;; (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●"))
  )


(defun jw/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
    visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . jw/org-mode-visual-fill)
  )


(provide 'init-org)
