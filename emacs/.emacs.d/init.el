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


;; evaluate package list and install missing packages
(defun packages-install (&rest packages)
  (message "running packages-install")
  (mapc (lambda (package)
          (let ((name (car package))
                (repo (cdr package)))
            (when (not (package-installed-p name))
              (let ((package-archives (list repo)))
                (package-initialize)
                (package-install name)))))
        packages)
  (package-initialize)
  (delete-other-windows))


;; Install extensions if they're missing
(defun init--install-packages ()
  (message "Lets install some packages")
  (packages-install
   ;; Since use-package this is the only entry here
   ;; ALWAYS try to use use-package!
   (cons 'use-package melpa)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;;; Load the config to configure the rest of the packages
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (smex use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
