;;; init-system.el --- configure Emacs general system settings.

(when system-type
  (let* ((sys-conf-name (concat "init-" (symbol-name system-type)))
         (sys-conf-file (concat user-elisp-directory sys-conf-name ".el")))
    (when (file-readable-p sys-conf-file)
      (load-library sys-conf-name))))



;;; Local paths

;; (defvar emacs-code (expand-file-name (concat emacs-home "/code"))
;;   "Emerging Emacs libraries and packages")
;; (add-to-list 'load-path emacs-code)

;; (defvar emacs-misc (expand-file-name (concat emacs-home "/misc"))
;;   "Third party Emacs packages not managed through package.el")
;; (add-to-list 'load-path emacs-misc)

;; (defvar emacs-info (expand-file-name (concat emacs-home "/info"))
;;   "Local texinfo documentation")
;; (add-to-list 'Info-additional-directory-list emacs-info)
  
(provide 'init-system)
;;; init-system.el ends here
