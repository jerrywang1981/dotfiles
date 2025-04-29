;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package restclient
  :mode ("\\.http\\'" . restclient-mode)
  )

(use-package company-restclient
  :after restclient
  :config
  (add-to-list 'company-backends 'company-restclient)
  )

(provide 'init-http)
