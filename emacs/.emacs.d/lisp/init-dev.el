;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:


(use-package editorconfig
  :commands editorconfig-mode
  :config
  (editorconfig-mode 1)
  )

(defun prog-extra-modes()
  "Extra modes when in programming mode."

  (setq display-line-numbers-type 'relative)
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (column-number-mode)
  (display-line-numbers-mode)
  (flymake-mode)
  ;; (flycheck-mode t)
  (electric-pair-mode t)
  (show-paren-mode t)
  (hs-minor-mode)
  (editorconfig-mode t)
  (editorconfig-apply)
  (auto-fill-mode t)
)

(use-package highlight-parentheses
  :hook (prog-mode . highlight-parentheses-mode))


(add-hook 'prog-mode-hook 'prog-extra-modes)


(use-package company
  :hook (after-init . global-company-mode)
  :config (setq company-minimum-prefix-length 1
                company-show-quick-access t))

(require 'company)


(use-package yasnippet
  :hook
  (prog-mode . yas-minor-mode)
  :config
  (yas-reload-all)
  ;; add company-yasnippet to company-backends
  (defun company-mode/backend-with-yas (backend)
    (if (and (listp backend) (member 'company-yasnippet backend))
	backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))
  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends))
  ;; unbind <TAB> completion
  (define-key yas-minor-mode-map [(tab)]        nil)
  (define-key yas-minor-mode-map (kbd "TAB")    nil)
  (define-key yas-minor-mode-map (kbd "<tab>")  nil)
  :bind
  (:map yas-minor-mode-map ("S-<tab>" . yas-expand))
  )

(use-package yasnippet-snippets
  :after yasnippet)

(use-package neotree
  :init
  (add-hook 'neotree-mode-hook #'(lambda()
                                ;; (local-unset-key (kbd "SPC") nil)
                                (evil-surround-mode -1)
                                (evil-collection-unimpaired-mode -1)
                                (evil-local-mode -1)
                                   ))
  ;; :bind
  ;; ("C-c t 1" . neotree-toggle)
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (evil-set-initial-state 'neotree-mode 'emacs)
  )

(use-package tree-sitter
 :init
 (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
 :hook (after-init . global-tree-sitter-mode)
)
(use-package tree-sitter-langs)

;; Golang
(use-package go-mode)
(use-package json-mode)
(use-package css-mode)
;; (use-package rhtml-mode)
(use-package markdown-mode)
;(use-package java-mode)
;; (use-package js-mode)

(use-package lua-mode)
(use-package rjsx-mode)
(use-package rust-mode)
(use-package typescript-mode)
(use-package toml-mode)
(use-package yaml-mode)
;; (use-package prettier
;;   :init
;;   (add-hook 'js2-mode-hook 'prettier-js-mode)
;;   (add-hook 'web-mode-hook 'prettier-js-mode)
;;   :config
;;   (setq prettier-prettify-on-save-flag nil
;;         prettier-editorconfig-flag nil
;;     )
;;   )

(use-package web-mode
  ;; :mode
  ;; ("\\.html\\'" . web-mode)
  ;; ("\\.js\\'" . web-mode)
  ;; :config
  ;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  )





(provide 'init-dev)
