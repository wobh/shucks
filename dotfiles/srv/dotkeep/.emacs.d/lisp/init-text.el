;;; init-text.el --- configure Emacs text mode

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'visual-line-mode t)

(setq sentence-end-double-space nil)
(setq require-final-newline t)

;; coding systems
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(provide 'init-text)
;;; init-text.el ends here
