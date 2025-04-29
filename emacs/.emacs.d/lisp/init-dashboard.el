;;; init.el --- the entry of emacs config -*- lexical-binding: t -*-

;; Author: Jerry Wang
;; Maintainer: Jerry Wang

;;; Commentary:
;; (c) Jerry Wang, 2023-

;;; Code:



(use-package dashboard
  :config
  (setq
   dashboard-startup-banner nil
   dashboard-projects-backend 'project-el
   ;; dashboard-set-navigator t
   dashboard-banner-logo-title "
      _                       __          __
     | |                      \\ \\        / /
     | | ___ _ __ _ __ _   _   \\ \\  /\\  / /_ _ _ __   __ _
 _   | |/ _ \\ |__| |__| | | |   \\ \\/  \\/ / _| | |_ \\ / _` |
| |__| |  __/ |  | |  | |_| |    \\  /\\  / (_| | | | | (_| |
 \\____/ \\___|_|  |_|   \\__| |     \\/  \\/ \\__|_|_| |_|\\__| |
                        __/ |                         __/ | * @jerrywang1981 github
                       |___/                         |___/  * https://jerrywang1981.github.io
                                                            * jerrywang1981@outlook.com
"
   dashboard-show-shortcuts t
   dashboard-init-info ".--- . .-. .-. -.--  .-- .- -. --."
   dashboard-items '(
                     (projects . 5)
                     (recents  . 5)
                     )
   dashboard-footer-messages '("
春风杨柳万千条, 六亿神州尽舜尧
红雨随心翻作浪, 青山着意化为桥
天连五岭银锄落, 地动三河铁臂摇
借问瘟君欲何往, 纸船明烛照天烧
                               七律二首 送瘟神
")
   ;; dashboard-startup-banner nil
   )
  )

(dashboard-setup-startup-hook)

(provide 'init-dashboard)
