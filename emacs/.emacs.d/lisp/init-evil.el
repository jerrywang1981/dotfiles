;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
)

(evil-mode 1)


(setq undo-limit 8000000
      undo-strong-limit 8000000
      undo-outer-limit 8000000)

;; (2048-game ag alchemist anaconda-mode apropos arc-mode atomic-chrome auto-package-update beginend bluetooth bm bookmark (buff-menu "buff-menu") calc calendar cider cmake-mode color-rg comint company compile consult corfu crdt (custom cus-edit) cus-theme dashboard daemons deadgrep debbugs debug devdocs dictionary diff-hl diff-mode dired dired-sidebar disk-usage distel doc-view docker ebib ebuku edbi edebug ediff eglot elpaca explain-pause-mode eldoc elfeed elisp-mode elisp-refs elisp-slime-nav embark emms epa ert eshell eval-sexp-fu evil-mc eww fanyi finder flycheck flymake forge free-keys geiser ggtags git-timemachine gited gnus go-mode grep guix hackernews helm help helpful hg-histedit hungry-delete ibuffer image image-dired image+ imenu imenu-list (indent "indent") indium info ivy js2-mode leetcode lispy lms log-edit log-view lsp-ui-imenu lua-mode kotlin-mode macrostep man (magit magit-repos magit-submodule) magit-section magit-todos markdown-mode monky mpc mpdel mu4e mu4e-conversation neotree newsticker notmuch nov omnisharp org org-present org-roam osx-dictionary outline p4 (package-menu package) pass (pdf pdf-view) popup proced (process-menu simple) prodigy profiler python quickrun racer racket-describe realgud reftex replace restclient rg ripgrep rjsx-mode robe rtags ruby-mode scheme scroll-lock selectrum sh-script shortdoc simple simple-mpc slime sly snake so-long speedbar tab-bar tablist tabulated-list tar-mode telega (term term ansi-term multi-term) tetris thread tide timer-list transmission trashed tuareg typescript-mode vc-annotate vc-dir vc-git vdiff vertico view vlf vterm vundo w3m wdired wgrep which-key woman xref xwidget yaml-mode youtube-dl zmusic (ztree ztree-diff ztree-dir))

(use-package evil-collection
  :config
  (delete 'vterm evil-collection-mode-list)
  (delete '(term term ansi-term multi-term) evil-collection-mode-list)
  (delete '(magit magit-repos magit-submodule) evil-collection-mode-list)
  (delete 'magit-section evil-collection-mode-list)
  (delete 'magit-todos evil-collection-mode-list)
  (delete 'dired evil-collection-mode-list)
  (delete 'dired-sidebar evil-collection-mode-list)
  :after evil)

(evil-collection-init)
(evil-set-initial-state 'dired-mode 'emacs)

(use-package evil-surround
  :ensure t
  :after evil
  )
(global-evil-surround-mode 1)

(use-package evil-matchit
  :ensure t
  :after evil
  :config
 (global-evil-matchit-mode 1))

(use-package evil-escape
  :ensure t
  :after evil
  :config
  (setq-default evil-escape-key-sequence "jk")
  (setq-default evil-escape-delay 0.3)
  (setq evil-escape-excluded-major-modes '(dired-mode))
  )
(evil-escape-mode 1)

(use-package evil-commentary
  :after evil)
(evil-commentary-mode)

(provide 'init-evil)
