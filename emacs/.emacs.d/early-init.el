;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:
(unless (>= emacs-major-version 28)
  (error "ONLY EMACS v28+ IS SUPPORTED!"))


;; For speed up the startup, please do NOT forget reset it to default
;; after Emacs after-init-hook, or it may cause freezes.
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

;; Prevent unwanted runtime compilation for native-comp users
(setq inhibit-automatic-native-compilation t)

;; Package initialize occurs automatically, before `user-init-file' is loaded
;; but after `early-init-file'. If you want to handle package initialization,
;; you can prevent Emacs from doing it early by uncomment next line!
(setq package-enable-at-startup nil)


(setq load-prefer-newer noninteractive)

;; Do not resize the frame at this early stage.
(setq frame-inhibit-implied-resize t)


;; Clean GUI
(push '(scroll-bar-mode . nil) default-frame-alist)
(push '(tool-bar-mode . nil) default-frame-alist)
(push '(menu-bar-mode . nil) default-frame-alist)

;; Misc settings
(setq mode-line-compact t)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)

;(load-theme 'modus-operandi t)
;(load-theme 'tango-dark)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "RET") 'newline-and-indent)

;;(setq confirm-kill-emacs #'yes-or-no-p)   
(electric-pair-mode t)                      
(add-hook 'prog-mode-hook #'show-paren-mode)
(column-number-mode t)                      
(global-auto-revert-mode t)                 
(delete-selection-mode t)                   
(setq inhibit-startup-message t)            
(setq make-backup-files nil)                
(add-hook 'prog-mode-hook #'hs-minor-mode)  
(global-display-line-numbers-mode 1)        

(when (display-graphic-p) (toggle-scroll-bar -1)) ; 

(savehist-mode 1)

(setq display-line-numbers-type 'relative) 
(add-to-list 'default-frame-alist '(width . 90)) 
(add-to-list 'default-frame-alist '(height . 55))

(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(provide 'init-early)
