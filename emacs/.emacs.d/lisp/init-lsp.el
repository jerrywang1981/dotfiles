;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l"
	lsp-file-watch-threshold 500)
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (python-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (web-mode . lsp-deferred)
         (css-mode . lsp-deferred)
         (html-mode . lsp-deferred)
         (vue-mode . lsp-deferred)
         (json-mode . lsp-deferred)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred)
  :config
    (setq lsp-completion-provider :none)
    (setq lsp-headerline-breadcrumb-enable t)
  :bind
    ("C-c l s" . lsp-ivy-workspace-symbol))


;(add-hook 'go-mode-hook #'lsp-deferred)

;; optionally
(use-package lsp-ui
  :commands lsp-ui-mode
  :config
;;  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-doc-position 'top)
  )

;; if you are ivy user
(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol
  :after (lsp-mode)
  )

(provide 'init-lsp)
