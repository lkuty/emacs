(add-to-list 'load-path "~/.emacs.d/vendor/slime")
(add-to-list 'load-path "~/.emacs.d/vendor/slime/contrib")
(add-to-list 'load-path "~/.emacs.d/vendor/clojure-mode")
(add-to-list 'load-path "~/.emacs.d/vendor/swank-clojure/src/emacs")

;;(setq swank-clojure-binary "/Users/ludo/bin/clj")
;;(setq
;; swank-clojure-jar-path "~/Applications/clojure/clojure/clojure.jar"
(setq swank-clojure-extra-classpaths (list "~/.clojure/clojure_cp/clojure-contrib.jar"))

;;;;(println (seq (.getURLs (java.lang.ClassLoader/getSystemClassLoader))))
(setq swank-clojure-jar-path "~/.clojure/clojure_cp/clojure.jar")
;; (setq swank-clojure-classpath (list "~/.clojure/clojure_cp/*.jar"))

(require 'clojure-mode)

(require 'swank-clojure-autoload)

;;;; SLIME
(require 'slime)

(eval-after-load "slime" '(progn (slime-setup '(slime-repl))))

(eval-after-load "slime"
   '(progn
      (require 'slime-fuzzy)
      (setq slime-complete-symbol*-fancy t)
      (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))

(add-hook 'clojure-mode-hook
          '(lambda ()
             (define-key clojure-mode-map "\C-cc" 'comment-region)
             (define-key clojure-mode-map "\C-cu" 'uncomment-region)))

(defun run-clojure ()
  "Starts clojure in Slime"
  (interactive)
  (slime 'clojure))

(define-key slime-mode-map (kbd "C-t") 'transpose-sexp)
(define-key slime-mode-map (kbd "C-M-t") 'transpose-chars)
(define-key slime-mode-map (kbd "C-b") 'backward-sexp)
(define-key slime-mode-map (kbd "C-M-b") 'backward-char)
(define-key slime-mode-map (kbd "C-f") 'forward-sexp)
(define-key slime-mode-map (kbd "C-M-f") 'forward-char)

;;;; uniquify
(setq
  uniquify-buffer-name-style 'post-forward
  uniquify-separator ":")

(require 'list-register)

(require 'uniquify)
;;(setq uniquify-buffer-name-style 'reverse)
;;(setq uniquify-separator " • ")
;;(setq uniquify-after-kill-buffer-p t)
;;(setq uniquify-ignore-buffers-re "^\\*")

;; IDO
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(add-to-list 'ido-ignore-files "\\.DS_Store")

;;(require 'parenface)
;;(set-face-foreground 'paren-face "blue4")
