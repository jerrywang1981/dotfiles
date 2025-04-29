;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:

(define-key evil-motion-state-map (kbd "SPC") nil)
(define-key dashboard-mode-map (kbd "SPC") nil)

;; git-gutter hunk
(defhydra hydra-git-gutter (:body-pre (git-gutter-mode 1) :hint nil)
  "
Git gutter:
_j_: next hunk      _s_: stage hunk  _q_uit
_k_: previous hunk  _r_: revert hunk
"
  ("j" git-gutter:next-hunk)
  ("k" git-gutter:previous-hunk)
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("q" nil)
  )

(my-ctrl-c
  "h"
  '(hydra-git-gutter/body :which-key "Hunk")
  )

;; for lsp (goto)

;_r_: References
(defhydra hydra-lsp-g (:hint nil)
  "
LSP Functions:
_i_: Implementation  _d_: declaration _t_: Type definition
"
  ;; ("i" lsp-find-implementation :color blue)
  ;; ("r" lsp-find-references :color blue)
  ("i" eglot-find-implementation :color blue)
  ("d" eglot-find-declaration :color blue)
  ("t" eglot-find-typeDefinition :color blue)
  ("q" nil)
  )

;; for lsp (formatter)
(defhydra hydra-lsp-eq (:hint nil)
  "
Formatter:
_=_: Format All  _e_: Editor Config   _l_: Lsp Format   _q_: quit
"
  ("=" format-all-buffer :color blue)
  ;; ("l" lsp-format-buffer :color blue)
  ("l" eglot-format-buffer :color blue)
  ("e" editorconfig-format-buffer :color blue)
  ("q" nil)
  )

(defhydra hydra-lsp-l (:hint nil)
  "
Misc Lsp Functions:
_q_: Quickfix   _o_: Organize Imports   _r_: Rename  _q_: quit
"
  ("q" eglot-code-action-quickfix :color blue)
  ("o" eglot-code-action-organize-imports :color blue)
  ("r" eglot-rename :color blue)
  ("q" nil)
  )

(defhydra hydra-project-p (:hint nil)
  "
Project:
_p_: Switch project   _f_: Find files _g_: Grep in project  _h_: Recent files  _q_: quit
"
  ("p" project-switch-project :color blue)
  ("f" counsel-git :color blue)
  ("g" counsel-git-grep :color blue)
  ("h" counsel-recentf :color blue)
  ("q" nil)
  )


(general-define-key
  :states '(normal visual motion)
  :keymaps 'override
  :prefix "SPC"
  "1" '(neotree :which-key "Neo Tree")
  "4" '(multi-vterm-next :which-key "VTerm")
  "p" '(hydra-project-p/body :which-key "Project")
  )

(general-define-key
  :states '(normal visual motion)
  :keymaps 'prog-mode-map
  :prefix "SPC"
  "g" #'(hydra-lsp-g/body :which-key "Goto")
  ;; "d" #'(lsp-treemacs-errors-list :which-key "Diagonostic")
  ;; "a" #'(lsp-execute-code-action :which-key "Code Action")
  "d" #'(flymake-show-buffer-diagnostics :which-key "Diagonostic")
  "a" #'(eglot-code-actions :which-key "Code Action")
  "l" #'(hydra-lsp-l/body :which-key "Misc Lsp")
  "=" #'(hydra-lsp-eq/body :which-key "Format")
  )

(provide 'init-bindings)
