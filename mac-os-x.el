;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mac OS X specific stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; delete files by moving them to the OS X trash
(setq delete-by-moving-to-trash t)

(setq default-input-method "MacOSX")

(global-set-key (kbd "M-/") (lambda () (interactive) (insert "\\")))
(global-set-key (kbd "M-(") (lambda () (interactive) (insert "{")))
(global-set-key (kbd "M-)") (lambda () (interactive) (insert "}")))
(global-set-key (kbd "M-5") (lambda () (interactive) (insert "[")))
(global-set-key (kbd "M-°") (lambda () (interactive) (insert "]")))
(global-set-key (kbd "M-n") (lambda () (interactive) (insert "~")))
(global-set-key (kbd "M-L") (lambda () (interactive) (insert "|")))

;; set up the default font
;; note: to turn off antialiasing for all fonts less than or equal to
;; 10 point, run the following command
;;    defaults write org.gnu.AquamacsEmacs AppleAntiAliasingThreshold 10
;;    defaults write org.gnu.Emacs AppleAntiAliasingThreshold 10
(set-default-font "-apple-monaco-medium-r-normal-*-18-*-*-*-*-*-*-*")
