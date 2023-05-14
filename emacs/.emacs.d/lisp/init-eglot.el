;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package eglot
  :hook ((css-mode go-mode java-mode js-mode kotlin-mode python-mode rust-mode ruby-mode web-mode) . eglot-ensure)
  :config
  (general-create-definer my-lsp-leader
    :keymaps 'eglot-mode-map
    :prefix "C-c l")
  (my-lsp-leader
    "=" '(eglot-format-buffer :which-key "format")
    )

  )

(provide 'init-eglot)
