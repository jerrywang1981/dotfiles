;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:



(use-package dashboard
  :config
  (setq dashboard-banner-logo-title nil
	dashboard-show-shortcuts nil
	dashboard-init-info "This is an init message!"
	dashboard-items '((recents  . 10))
	dashboard-footer-messages '("Dashboard is \npretty cool!")
	dashboard-startup-banner nil)
  )

(dashboard-setup-startup-hook)

(provide 'init-dashboard)
