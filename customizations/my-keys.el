;;;;;;;;;;;;;;; GLOBAL KEYBOARD-BINDINGS
;;;;;;;;;;;;;;; (can be overridden by other modes)

(global-set-key (kbd "C-z") 'set-mark-command)
(global-set-key [C-tab] 'other-window)
(global-set-key "\r" 'newline-and-indent)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key [C-backspace] 'backward-kill-word)

;(global-set-key [f6] 'slime-load-file)  ; Hit this to eval an entire file

;;(global-set-key [s-left] 'enlarge-window-horizontally)  ; S = Super/Window
;;(global-set-key [s-right] 'shrink-window-horizontally)

(add-hook 'clojure-mode-hook
	  '(lambda ()
             (define-key clojure-mode-map "\C-c\C-e" 'lisp-eval-last-sexp)
             (define-key clojure-mode-map "\C-x\C-e" 'lisp-eval-last-sexp)
             (local-set-key (kbd "<s-tab>") 'slime-eval-defun)
             (local-set-key (kbd "M-RET") 'dabbrev-expand)))

(global-set-key (kbd "C-x r v") 'list-register)

;;;; buffer switching

(global-set-key (kbd "M-s-<left>") 'previous-buffer)
(global-set-key (kbd "M-s-<right>") 'next-buffer)

(global-set-key (kbd "s-<up>") 'beginning-of-buffer)
(global-set-key (kbd "s-<down>") 'end-of-buffer)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<left>") 'move-beginning-of-line)
(global-set-key (kbd "s-<right>") 'move-end-of-line)

;; Easier window switching
;; Use option + arrows
(windmove-default-keybindings 'meta)

;; fix emacs backgrounding accidents
(global-set-key (kbd "C-z") nil)
