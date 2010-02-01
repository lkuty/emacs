;; Enable syntax highlighting when editing code.
(global-font-lock-mode 1)

;; Everything is UTF-8
(setq current-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)

;; parentheses
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq show-paren-style 'parenthesis)
;;(setq show-paren-style 'expression)

;; (autoload 'paredit-mode "paredit"
;;   t)
;; (add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))
;; (add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))

;; active region is rendered visually
(setq transient-mark-mode t)

; delete selection on key press
(delete-selection-mode t)

;; ;; Clozure-CL
;;(setq inferior-lisp-program "~/Applications/ccl/scripts/ccl64")
;;(setenv "CCL_DEFAULT_DIRECTORY" "~/Applications/ccl")

(defalias 'qrr 'query-replace-regexp)

;; make C-k delete the trailing newline as well
(setq kill-whole-line t)

;; real lisp hackers use the lambda character
;; courtesy of stefan monnier on c.l.l
;; 
(defun sm-lambda-mode-hook ()
  (font-lock-add-keywords
   nil `(("\\<lambda\\>"
   (0 (progn (compose-region (match-beginning 0) (match-end 0)
        ,(make-char 'greek-iso8859-7 107))
      nil))))))
(add-hook 'emacs-lisp-mode-hook 'sm-lambda-mode-hook)
(add-hook 'lisp-interactive-mode-hook 'sm-lamba-mode-hook)
(add-hook 'scheme-mode-hook 'sm-lambda-mode-hook)

;; change yes or no prompt to y or n prompts
(fset 'yes-or-no-p 'y-or-n-p)

(defadvice kill-ring-save (before slick-copy activate compile) "When called
  interactively with no active region, copy a single line instead."
  (interactive (if mark-active
		   (list (region-beginning) (region-end))
		 (message "Copied line")
		 (list (line-beginning-position) (line-beginning-position 2)))))

(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
    (if mark-active (list (region-beginning) (region-end))
      (list (line-beginning-position)
        (line-beginning-position 2)))))

;;;; show column number in bar
(column-number-mode t)

; disable auto-save files (#foo#)
(setq auto-save-default nil)

; disable backup files (foo~)
(setq backup-inhibited t)

;; tabs
(setq c-basic-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
;;(highlight-tabs)

;; whitespace
;;(highlight-trailing-whitespace)
;;(setq-default show-trailing-whitespace t)
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; turn of the auto-backup feature
(setq make-backup-files nil)

(setq x-select-enable-clipboard t)

(require 'linum)
;;;; line numbering
;;(global-set-key (kbd "<f6>") 'linum)
(global-linum-mode 0)
(setq linum-format "%d ") ; space after line number

