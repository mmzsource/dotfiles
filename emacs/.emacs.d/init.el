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

(message "%s" "MMz: Delete old config.el")

;; The function org-babel-load-file will create and load a new config.el
;; only when the config.org file is newer than the config.el file.
;; because I'm using dotfiles and creating a symlink to my config.org, the
;; symlink won't be updated when I change my original config.org!
;; Since I seldomly restart my emacs, this is the best solution for me:

(defvar-local config-file (concat user-emacs-directory "config.el"))
(when (file-exists-p config-file) (delete-file config-file))

(message "%s" "MMz: Start loading config file.")

;;; Load the config to configure the rest of the packages
(org-babel-load-file (concat user-emacs-directory "config.org"))

(message "%s" "MMz: End loading config file.")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "bbe6dc4337a5350a516d4041ef8dd4d019461dda41c45c83d7aff35e9ed127c1" "265beed2347158e958a085bd645d816bb7354942c35415cdaf0c0b58285e2967" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(package-selected-packages (quote (deft cider smex use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
