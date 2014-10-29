;;; init-display.el --- configurations for Emacs display

;; display options
(global-font-lock-mode t)  ; syntax highlighting everywhere
(show-paren-mode t)        ; match parens

(setq visible-bell t)                 ; disable visual beep
(setq scroll-conservatively 101)      ; scroll only enough to reveal cursor

(put 'narrow-to-region 'disabled nil) ; use narrow-to-region


;; frame ornaments
(menu-bar-mode nil)    ; hide menu bar
(scroll-bar-mode nil)  ; hide scroll bars
(tool-bar-mode nil)    ; hide tool bars

(when window-system
  (tooltip-mode nil))


;; color theme
;; (add-to-list 'custom-theme-load-path 
;; 	     (concat
;; 	      (file-name-as-directory user-emacs-directory) "misc"))

;; (when (eq system-type 'windows-nt)
;;   (load-theme 'zenburn))
;; (when (and (eq system-type 'darwin) (display-graphic-p))
;;   (load-theme 'base-16-eighties))


;; mode-line
(column-number-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;;(uniquify-strip-common-suffix t)

;;<<init-faces>>

(provide 'init-display)
;;; init-display.el ends here
