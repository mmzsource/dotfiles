;; Setup environment and package manager
;; found a lot of this configuration documented on
;; https://gitlab.com/buildfunthings/emacs-config/blob/master/loader.org

;; Environment
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(push "/usr/local/bin" exec-path)

(require 'package)

(defvar gnu          '("gnu"          . "https://elpa.gnu.org/packages/"))
(defvar melpa        '("melpa"        . "https://melpa.org/packages/"))
(defvar melpa-stable '("melpa-stable" . "https://stable.melpa.org/packages/"))
(defvar org-elpa     '("org"          . "http://orgmode.org/elpa/"))


;; Add package repos
;; Default archive setting is http, so reset and then set to https
(setq package-archives nil)
(add-to-list 'package-archives melpa-stable t)
(add-to-list 'package-archives melpa        t)
(add-to-list 'package-archives gnu          t)
(add-to-list 'package-archives org-elpa     t)

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; Load the config to configure the rest of the packages
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bbe6dc4337a5350a516d4041ef8dd4d019461dda41c45c83d7aff35e9ed127c1" "265beed2347158e958a085bd645d816bb7354942c35415cdaf0c0b58285e2967" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (smex use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
