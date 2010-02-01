;; color-theme
;(require 'color-theme)
(color-theme-initialize)
(color-theme-sitaramv-nt) ; Loading this first gives me yellow buffer names
(color-theme-charcoal-black)

(if (fboundp 'tabbar-mode) (tabbar-mode -1))
(tool-bar-mode -1)
(fringe-mode -1)
(scroll-bar-mode -1)

(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; Quiet startup
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)

;;;; full screen

;; does not work in Mac OS X with Emacs vanilla 23.1

(defun djcb-fullscreen-toggle ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
;;(global-set-key (kbd "<f6>") 'djcb-fullscreen-toggle)

;(if (>= emacs-major-version 23)
;    (set-default-font "Inconsolata-16"))

(defun maximize-frame ()
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 1000 1000))

;;;; smooth scrolling

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse    
(setq scroll-step 1) ;; keyboard scroll one line at a time

;;;; line hightlighting

;; highlight the current line; set a custom face, so we can
;; recognize from the normal marking (selection)
;;(defface hl-line '((t (:background "Gray")))
;;  "Face to use for `hl-line-face'." :group 'hl-line)
;;(setq hl-line-face 'hl-line)
;;(global-hl-line-mode t) ; turn it on for all modes by default
