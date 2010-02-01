(setq exec-path (append '("/usr/local/bin" "/opt/local/bin" "~/bin") exec-path))

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/customizations")
(add-to-list 'load-path "~/.emacs.d/utilities")

; handy function to load all elisp files in a directory
(load-file "~/.emacs.d/load-directory.el")

; load utility functions
(mapcar 'load-directory '("~/.emacs.d/utilities"))

(vendor 'color-theme)

; load personal customizations (keybindings, colors, etc.)
(mapcar 'load-directory '("~/.emacs.d/customizations"))

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; Mac OS X specific stuff
(when (eq system-type 'darwin)
    (load "mac-os-x.el"))

;;;; NOT MOVED YET

;; Place all backup files in one directory
;;(setq backup-directory-alist (list (cons ".*" (expand-file-name "~/.emacsbackup/"))))

(setq auto-mode-alist
      (append '(("\.lisp$" . lisp-mode)
                ("\.lsp$" . lisp-mode)
                ("\.cl$" . lisp-mode)
                ("\\.js$" . java-mode)
                ("\.asd$" . lisp-mode)
                ("\.system$" . lisp-mode)
                ("\\.clj$" . clojure-mode))
              auto-mode-alist))
